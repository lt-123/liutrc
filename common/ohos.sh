#!/usr/bin/env bash

#配置hvigor、ohpm环境变量
export PATH=${COMMANDLINE_TOOL_DIR}/command-line-tools/bin:$PATH

#配置hdc环境变量
export HDC_HOME=${COMMANDLINE_TOOL_DIR}/command-line-tools/sdk/default/openharmony/toolchains #设置hdc工具的环境变量，hdc工具在toolchains所在路径下，请以实际路径为准
export PATH=$HDC_HOME:$PATH

# 切换到指定目录$1并执行ohpm install指令
function ohpm_install() {
    cd $1 || exit       # $1：函数第一个参数, 必须是路径
    ohpm install --all  # 安装所有依赖
}

# 连接 chrome 调试
# 来自 https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/web-debugging-with-devtools#linux%E6%88%96mac%E5%B9%B3%E5%8F%B0
function hdc_conn_web() {
    # Get current fport rule list
    CURRENT_FPORT_LIST=$(hdc fport ls)

    # Delete the existing fport rule one by one
    while IFS= read -r line; do
        # Extract the taskline
        IFS=' ' read -ra parts <<< "$line"
        taskline="${parts[1]} ${parts[2]}"

        # Delete the corresponding fport rule
        echo "Removing forward rule for $taskline"
        hdc fport rm $taskline
        result=$?

        if [ $result -eq 0 ]; then
            echo "Remove forward rule success, taskline:$taskline"
        else
            echo "Failed to remove forward rule, taskline:$taskline"
        fi

    done <<< "$CURRENT_FPORT_LIST"

    # Initial port number
    INITIAL_PORT=9222

    # Get the current port number, use initial port number if not set previously
    CURRENT_PORT=${PORT:-$INITIAL_PORT}

    # Get the list of all PIDs that match the condition
    PID_LIST=$(hdc shell cat /proc/net/unix | grep webview_devtools_remote_ | awk -F '_' '{print $NF}')

    if [ -z "$PID_LIST" ]; then
        echo "Failed to retrieve PID from the device"
        exit 1
    fi

    # Increment the port number
    PORT=$CURRENT_PORT

    # Forward ports for each application one by one
    for PID in $PID_LIST; do
        # Increment the port number
        PORT=$((PORT + 1))

        # Execute the hdc fport command
        hdc fport tcp:$PORT localabstract:webview_devtools_remote_$PID

        # Check if the command executed successfully
        if [ $? -ne 0 ]; then
            echo "Failed to execute hdc fport command"
            exit 1
        fi
    done

    # List all forwarded ports
    hdc fport ls

}

