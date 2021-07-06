#!/bin/bash

DOTFILES_DIR=new-dotfiles
DOTFILES_PATH=$HOME/DOTFILES_DIR
if [ -d "$DOTFILES_PATH" ]; then
  rm -rf "$DOTFILES_PATH"
fi

git clone https://github.com/jdansev/dotfiles-v3.0.git $DOTFILES_PATH

INSTALLER_BIN=dotfiles
INSTALLER_PATH=/usr/local/sbin/$INSTALLER_BIN

chmod +x $DOTFILES_PATH/install/installer.sh
ln -sf $DOTFILES_PATH/install/installer.sh $INSTALLER_PATH

echo "Installed at $INSTALLER_PATH"

