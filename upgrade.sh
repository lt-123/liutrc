#!/usr/bin/env bash

function liutrc_upgrade() {
  dir=$(pwd)
  cd $LIUT_RC_HOME
  git pull
  cd $dir
}
