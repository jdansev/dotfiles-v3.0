#!/bin/bash


get_platform() {
  case "$(uname -s)" in
    Linux*)  platform=Linux   ;;
    Darwin*) platform=Darwin  ;;
    CYGWIN*) platform=Cygwin  ;;
    MINGW*)  platform=MinGw   ;;
    *)       platform=Unknown ;;
  esac
}


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


colorme() {
  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
}


help() {
  printf "$BLUE"
  cat << EOF

Usage: $0 [OPTIONS]

  -h, --help           Show this message

EOF
  printf "$RESET"
}


error() {
  echo "${RED}Error: $@${RESET}" 1>&2
}


main() {

  for opt in "$@"; do
    case $opt in

      --help)
        help
        ;;

      *)
        error "unknown option: $opt"
        help
        exit 1
        ;;

    esac
  done

  get_platform
  install_packer
}

colorme
main "$@"

