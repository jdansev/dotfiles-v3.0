#!/usr/bin/env bash


GIT_REPO=https://github.com/jdansev/dotfiles-v3.0.git
CLONE_OPTIONS="--quiet"
CLONE_PATH=$HOME/.dotfiles

BIN_NAME=dotfiles
BIN_SRC_PATH=src/installer.sh
BIN_INSTALL_PATH=/usr/local/sbin


clone_repo() {
  [ -d "$CLONE_PATH" ] && rm -rf $CLONE_PATH
  git clone $CLONE_OPTIONS $GIT_REPO $CLONE_PATH
}

link_binary() {
  sudo ln -sfn $CLONE_PATH/$BIN_SRC_PATH $BIN_INSTALL_PATH/$BIN_NAME
  chmod +x $CLONE_PATH/$BIN_SRC_PATH
}


clone_repo
link_binary

echo "\nInstalled at $BIN_INSTALL_PATH/$BIN_NAME\n"


