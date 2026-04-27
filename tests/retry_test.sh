#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=../common/common_func.sh
source "$ROOT_DIR/common/common_func.sh"

sleep() {
  :
}

assert_eq() {
  local expected=$1
  local actual=$2
  local message=$3

  if [[ "$expected" != "$actual" ]]; then
    echo "FAIL: $message: expected <$expected>, got <$actual>" >&2
    exit 1
  fi
}

test_retry_stops_on_sudo_password_timeout() {
  local attempts=0

  sudo_timeout_command() {
    attempts=$((attempts + 1))
    echo "sudo: timed out reading password" >&2
    return 1
  }

  retry sudo_timeout_command >/tmp/retry_test_stdout 2>/tmp/retry_test_stderr || true

  assert_eq 1 "$attempts" "sudo password timeout should not be retried"
}

test_retry_stops_on_chinese_sudo_password_timeout() {
  local attempts=0

  sudo_timeout_command() {
    attempts=$((attempts + 1))
    echo "sudo: 读密码超时" >&2
    return 1
  }

  retry sudo_timeout_command >/tmp/retry_test_stdout 2>/tmp/retry_test_stderr || true

  assert_eq 1 "$attempts" "Chinese sudo password timeout should not be retried"
}

test_retry_still_retries_transient_failures() {
  local attempts=0

  transient_command() {
    attempts=$((attempts + 1))
    [[ $attempts -ge 3 ]]
  }

  retry transient_command >/tmp/retry_test_stdout 2>/tmp/retry_test_stderr || true

  assert_eq 3 "$attempts" "transient failures should still be retried"
}

test_retry_stops_on_sudo_password_timeout
test_retry_stops_on_chinese_sudo_password_timeout
test_retry_still_retries_transient_failures

echo "retry tests passed"
