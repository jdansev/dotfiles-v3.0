#!/usr/bin/env bash

DOTFILES_DIR=.dotfiles
DOTFILES_PATH=$HOME/$DOTFILES_DIR
INSTALLER_BIN=dotfiles
INSTALLER_PATH=/usr/local/sbin/$INSTALLER_BIN

if [ -d "$DOTFILES_PATH" ]; then
  rm -rf "$DOTFILES_PATH"
fi

git clone https://github.com/jdansev/dotfiles-v3.0.git $DOTFILES_PATH

chmod +x $DOTFILES_PATH/src/installer.sh
sudo ln -sf $DOTFILES_PATH/src/installer.sh $INSTALLER_PATH

echo "Installed at $INSTALLER_PATH"


