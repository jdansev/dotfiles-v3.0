#!/usr/bin/env bash


. "$(pwd)/globals.sh"
. "$(pwd)/colors.sh"
. "$(pwd)/utils.sh"
. "$(pwd)/nvim-installer.sh"


install() {

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

  status_installing="${GREEN}INSTALLING${RESET}"
  status_skipped="${YELLOW}SKIPPED${RESET}"

  [ $VERBOSE == 1 ] && printf "\n"

  # Packages
  if [ $SKIP_PACKAGES -ne 1 ]; then
    [ $VERBOSE == 1 ] && echo -e "\tPackages: $status_installing"
  else
    [ $VERBOSE == 1 ] && echo -e "\tPackages: $status_skipped"
  fi

  # Zsh
  if [ $SKIP_ZSH -ne 1 ]; then
    [ $VERBOSE == 1 ] && echo -e "\tZsh: $status_installing"
  else
    [ $VERBOSE == 1 ] && echo -e "\tZsh: $status_skipped"
  fi

  # Tmux
  if [ $SKIP_TMUX -ne 1 ]; then
    [ $VERBOSE == 1 ] && echo -e "\tTmux: $status_installing"
  else
    [ $VERBOSE == 1 ] && echo -e "\tTmux: $status_skipped"
  fi

  # Nvim
  if [ $SKIP_NVIM -ne 1 ]; then
    [ $VERBOSE == 1 ] && echo -e "\tNvim: $status_installing"
  else
    [ $VERBOSE == 1 ] && echo -e "\tNvim: $status_skipped"
  fi

  [ $VERBOSE == 1 ] && printf "\n"

}

uninstall() {
  echo "Uninstalling..."
}


main() {
  set_custom_tabs
  detect_platform

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

  set_default_tabs
}


main "$@"


