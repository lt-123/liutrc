#!/usr/bin/env bash

function startTrojan() {
  chmod +x ~/.liut/trojan/start.command
  nohup sh ~/.liut/trojan/start.command &
  echo 'trojan 已启动'
}

function stopTrojan() {
  killall trojan
  echo 'trojan 已停止'
}

function showTrojan() {
  ps -ef | grep trojan
}
