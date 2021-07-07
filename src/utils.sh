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
  HL=$BLUE
  # NOH=$RESET
  NOH=$BLUE

  RESET=''
  cat << EOF

${NOH}Usage: $0 [-h | --help | COMMAND] [OPTIONS]

  ${HL}-h, --help${NOH}               Show this message

  ${HL}-V, --verbose${NOH}            Print information to the console

Commands:

  ${HL}symcheck${NOH}                 Lists the status of all dotfile symlinks

  ${HL}install${NOH}                  Install packages and symlink Zsh, Tmux and Neovim configurations

    ${HL}--skip-packages${NOH}

    ${HL}--skip-zsh${NOH}

    ${HL}--skip-tmux${NOH}

    ${HL}--skip-nvim${NOH}

  ${HL}uninstall${NOH}                Remove all dotfile configurations

EOF
}


