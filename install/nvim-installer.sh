#!/usr/bin/env bash


install_packer() {
  if [ ! -d "$HOME/.local/share/nvim/site/pack/packer" ]; then
    printf "Installing packer"
    git clone https://github.com/wbthomason/packer.nvim \
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    printf "\npacker installed!\n"
  fi
}


install_neovim_nightly() {
  echo 'Installing neovim nightly builds from appimage...'

  wget --quiet --directory-prefix=$HOME https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod +x $HOME/nvim.appimage
  ./$HOME/nvim.appimage --appimage-extract
  mv sqashfs-root $HOME/sqashfs-root

  # TODO: Rename AppRun to nvim

  sudo ln -sf $HOME/squashfs-root/AppRun /usr/local/bin/nvim
}


