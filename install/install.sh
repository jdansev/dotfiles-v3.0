#!/bin/bash

DOTFILES_DIR=new-dotfiles
DOTFILES_PATH=$HOME/DOTFILES_DIR
if [ -d "$DOTFILES_PATH" ]; then
  rm -rf "$DOTFILES_PATH"
fi

git clone https://github.com/jdansev/dotfiles-v3.0.git $DOTFILES_PATH

