#!/usr/bin/env bash

function liutrc_upgrade() {
  dir=$(pwd)
  cd $LIUTRC_HOME
  git pull
  cd dir
}
