#!/usr/bin/env bash

function liutrc_upgrade() {
  dir=$(pwd)
  cd $LIUTRC_HOM
  git pull
  cd dir
}
