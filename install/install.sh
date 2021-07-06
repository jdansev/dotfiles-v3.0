#!/bin/bash

DOTFILES_DIR=$HOME/new-dotfiles
if [ -d "$DOTFILES_DIR" ]; then
  rm -rf "$DOTFILES_DIR"
fi

git clone https://github.com/jdansev/dotfiles-v3.0.git $DOTFILES_DIR


