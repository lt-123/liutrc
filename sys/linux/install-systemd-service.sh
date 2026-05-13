#!/usr/bin/env bash
set -euo pipefail

# 中文注释：这是一个人类友好的 systemd 服务创建工具。
# 它会通过交互式提问收集常规可执行程序的启动信息，
# 生成 service 文件，并按用户选择配置开机自启动和立即启动。

SERVICE_DIR="/etc/systemd/system"

print_title() {
  echo
  echo "============================================================"
  echo "  systemd 服务创建工具"
  echo "============================================================"
  echo
}

info() {
  echo "提示：$*"
}

warn() {
  echo "注意：$*" >&2
}

die() {
  echo "错误：$*" >&2
  exit 1
}

need_root() {
  # 中文注释：写入 /etc/systemd/system 和执行 systemctl 通常需要 root 权限。
  if [[ "${EUID}" -ne 0 ]]; then
    die "请使用 root 运行，例如：sudo $0"
  fi
}

ask_required() {
  local prompt="$1"
  local value=""

  while true; do
    read -r -p "${prompt}: " value
    if [[ -n "${value//[[:space:]]/}" ]]; then
      printf '%s\n' "${value}"
      return 0
    fi
    warn "该项不能为空，请重新输入。"
  done
}

ask_yes_no() {
  local prompt="$1"
  local default="${2:-n}"
  local suffix="[y/N]"
  local answer=""

  if [[ "${default}" == "y" ]]; then
    suffix="[Y/n]"
  fi

  while true; do
    read -r -p "${prompt} ${suffix}: " answer
    answer="${answer:-${default}}"
    case "${answer}" in
      y|Y|yes|YES|Yes) return 0 ;;
      n|N|no|NO|No) return 1 ;;
      *) warn "请输入 y 或 n。" ;;
    esac
  done
}

validate_service_name() {
  local name="$1"

  # 中文注释：服务名限制为常见安全字符，避免意外写入奇怪路径。
  [[ "${name}" =~ ^[A-Za-z0-9_.@-]+$ ]] || \
    die "服务名称只能包含字母、数字、下划线、点、@ 和短横线。"

  if [[ "${name}" == *.service ]]; then
    printf '%s\n' "${name%.service}"
  else
    printf '%s\n' "${name}"
  fi
}

choose_service_type() {
  local choice=""

  echo >&2
  echo "请选择 systemd 服务 Type：" >&2
  echo "  1) simple  - 最常见。程序以前台方式运行，不主动 fork 到后台。推荐用于大多数普通可执行文件。" >&2
  echo "  2) exec    - 类似 simple，但 systemd 会等 execve 成功后才认为启动成功。适合较新的 systemd。" >&2
  echo "  3) forking - 程序启动后会自己进入后台，也就是传统 daemon 模式。" >&2
  echo "  4) oneshot - 执行一次就退出的任务，常用于初始化脚本；通常不适合长期运行服务。" >&2
  echo >&2
  echo "不确定时请选择 1。" >&2

  while true; do
    read -r -p "请输入编号 [1]: " choice
    choice="${choice:-1}"
    case "${choice}" in
      1) printf 'simple\n'; return 0 ;;
      2) printf 'exec\n'; return 0 ;;
      3) printf 'forking\n'; return 0 ;;
      4) printf 'oneshot\n'; return 0 ;;
      *) warn "请输入 1、2、3 或 4。" ;;
    esac
  done
}

quote_for_systemd() {
  # 中文注释：systemd 的 ExecStart 接收命令行字符串，这里保留用户原始输入。
  # 如果路径或参数包含空格，请用户在输入时自行加引号。
  printf '%s\n' "$1"
}

build_service_file() {
  local command="$1"
  local workdir="$2"
  local service_type="$3"
  local need_network="$4"
  local description="$5"

  echo "[Unit]"
  echo "Description=${description}"
  if [[ "${need_network}" == "yes" ]]; then
    echo "Wants=network-online.target"
    echo "After=network-online.target"
  else
    echo "After=network.target"
  fi
  echo
  echo "[Service]"
  echo "Type=${service_type}"
  echo "WorkingDirectory=${workdir}"
  echo "ExecStart=$(quote_for_systemd "${command}")"
  echo "Restart=on-failure"
  echo "RestartSec=5s"
  if [[ "${service_type}" == "oneshot" ]]; then
    echo "RemainAfterExit=yes"
  fi
  echo
  echo "[Install]"
  echo "WantedBy=multi-user.target"
}

write_service_file() {
  local service_file="$1"
  local content="$2"

  # 中文注释：使用临时文件写入，再安装到 systemd 目录，避免半写入状态。
  local tmp_file
  tmp_file="$(mktemp)"
  printf '%s\n' "${content}" > "${tmp_file}"
  install -m 0644 "${tmp_file}" "${service_file}"
  rm -f "${tmp_file}"
}

show_next_steps() {
  local service_name="$1"

  echo
  echo "常用管理命令："
  echo "  查看状态：systemctl status ${service_name}.service"
  echo "  查看日志：journalctl -u ${service_name}.service -f"
  echo "  启动服务：systemctl start ${service_name}.service"
  echo "  停止服务：systemctl stop ${service_name}.service"
  echo "  重启服务：systemctl restart ${service_name}.service"
  echo "  开机自启：systemctl enable ${service_name}.service"
  echo "  取消自启：systemctl disable ${service_name}.service"
  echo
}

main() {
  print_title
  need_root

  info "请按提示输入服务信息。如果命令或路径包含空格，请自行使用引号包裹。"
  echo

  local command
  local workdir
  local raw_service_name
  local service_name
  local service_type
  local need_network="no"
  local enable_on_boot="no"
  local start_now="no"
  local service_file
  local service_content

  command="$(ask_required "请输入执行命令，例如 /opt/myapp/app --config /opt/myapp/config.toml")"
  workdir="$(ask_required "请输入工作目录，例如 /opt/myapp")"
  [[ -d "${workdir}" ]] || die "工作目录不存在：${workdir}"

  raw_service_name="$(ask_required "请输入服务名称，例如 myapp 或 myapp.service")"
  service_name="$(validate_service_name "${raw_service_name}")"
  service_type="$(choose_service_type)"

  if ask_yes_no "该服务是否依赖系统网络完全就绪？例如需要联网、监听网卡地址、连接远程服务" "y"; then
    need_network="yes"
  fi

  if ask_yes_no "是否配置开机自启动？" "y"; then
    enable_on_boot="yes"
  fi

  if ask_yes_no "是否立即启动服务？" "y"; then
    start_now="yes"
  fi

  service_file="${SERVICE_DIR}/${service_name}.service"

  if [[ -e "${service_file}" ]]; then
    warn "服务文件已存在：${service_file}"
    ask_yes_no "是否覆盖现有服务文件？" "n" || die "用户取消，未覆盖现有服务文件。"
  fi

  service_content="$(build_service_file \
    "${command}" \
    "${workdir}" \
    "${service_type}" \
    "${need_network}" \
    "${service_name}")"

  echo
  echo "即将写入以下 systemd 配置："
  echo "------------------------------------------------------------"
  printf '%s\n' "${service_content}"
  echo "------------------------------------------------------------"
  echo

  ask_yes_no "确认写入并配置该服务？" "y" || die "用户取消，未写入服务文件。"

  write_service_file "${service_file}" "${service_content}"
  info "已写入：${service_file}"

  systemctl daemon-reload
  info "已执行：systemctl daemon-reload"

  if [[ "${enable_on_boot}" == "yes" ]]; then
    systemctl enable "${service_name}.service"
    info "已配置开机自启动。"
  else
    info "未配置开机自启动。"
  fi

  if [[ "${start_now}" == "yes" ]]; then
    systemctl start "${service_name}.service"
    info "已尝试立即启动服务。"
    systemctl --no-pager --lines=20 status "${service_name}.service" || true
  else
    info "未立即启动服务。"
  fi

  show_next_steps "${service_name}"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi
