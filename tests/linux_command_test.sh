#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
export LIUT_RC_HOME="$ROOT_DIR"

# shellcheck source=../sys/linux.sh
source "$ROOT_DIR/sys/linux.sh"

assert_contains() {
  local needle=$1
  local haystack=$2
  local message=$3

  if [[ "$haystack" != *"$needle"* ]]; then
    echo "FAIL: $message: expected to contain <$needle>" >&2
    exit 1
  fi
}

test_install_systemd_service_command_references_installer() {
  local function_type
  local function_body

  function_type="$(type -t install-systemd-service || true)"
  if [[ "$function_type" != "function" ]]; then
    echo "FAIL: install-systemd-service should be a function" >&2
    exit 1
  fi

  function_body="$(declare -f install-systemd-service)"
  assert_contains 'sys/linux/install-systemd-service.sh' "$function_body" \
    "install-systemd-service should reference installer script"
  assert_contains '"$@"' "$function_body" \
    "install-systemd-service should forward arguments"
}

test_install_systemd_service_command_references_installer

echo "linux command tests passed"
