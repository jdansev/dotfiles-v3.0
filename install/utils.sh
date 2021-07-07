#!/usr/bin/env bash


detect_platform() {
  case "$(uname -s)" in
    Linux*)  PLATFORM=Linux   ;;
    Darwin*) PLATFORM=Darwin  ;;
    CYGWIN*) PLATFORM=Cygwin  ;;
    MINGW*)  PLATFORM=MinGw   ;;
    *)       PLATFORM=Unknown ;;
  esac
}


set_custom_tabs() {
  tabs $(expr $TABS_CUSTOM + 1)
}

set_default_tabs() {
  tabs $(expr $TABS_DEFAULT + 1)
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


