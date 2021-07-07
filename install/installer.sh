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


error() {
  echo "${RED}Error: $@${RESET}" 1>&2
}


usage() {
  printf "$BLUE"
  cat << EOF

Usage: $0 [-h | COMMAND] [OPTIONS]

  -h, --help               Show this message


Commands:

  install                  Install packages and symlink Zsh, Tmux and Neovim configurations

    --skip-packages

    --skip-zsh

    --skip-tmux

    --skip-nvim

  uninstall                Remove all dotfile configurations

EOF
  printf "$RESET"
}


install() {
  echo "Installing..."

  local SKIP_PACKAGES=0
  local SKIP_ZSH=0
  local SKIP_TMUX=0
  local SKIP_NVIM=0

  for opt in $@; do
    case $opt in

      --skip-packages)  SKIP_PACKAGES=1;  ;;
      --skip-zsh)       SKIP_ZSH=1;       ;;
      --skip-tmux)      SKIP_TMUX=1;      ;;
      --skip-nvim)      SKIP_NVIM=1;      ;;

      *)
        error "unknown option: $opt"
        ;;

    esac
  done

  if [ $SKIP_PACKAGES -ne 0 ]; then
    echo "Skipping packages..."
  fi
  if [ $SKIP_ZSH -ne 0 ]; then
    echo "Skipping Zsh..."
  fi
  if [ $SKIP_TMUX -ne 0 ]; then
    echo "Skipping Tmux..."
  fi
  if [ $SKIP_NVIM -ne 0 ]; then
    echo "Skipping Nvim..."
  fi

}

uninstall() {
  echo "Uninstalling..."
}


main() {

  case $1 in

    -h|--help)
      usage
      ;;

    install)
      shift
      install $@
      ;;

    uninstall)
      shift
      uninstall
      ;;

    *)
      error "unknown option: $1"
      usage
      exit 1
      ;;

  esac

  get_platform
  install_packer
}

colorme
main "$@"

