#!/usr/bin/env bash


SCRIPT_PATH=$(dirname $(readlink -f $0))

. "$SCRIPT_PATH/globals.sh"
. "$SCRIPT_PATH/colors.sh"
. "$SCRIPT_PATH/utils.sh"
. "$SCRIPT_PATH/symlinker.sh"
. "$SCRIPT_PATH/install-nvim.sh"


# sets the flags for any installations to be skipped
check_skipped() {

  for opt in $@; do
    case $opt in

      --skip-packages)  SKIP_PACKAGES=1;  ;;
      --skip-dotfiles)  SKIP_DOTFILES=1;  ;;

      *) error "unknown option: $opt";    ;;
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

  # Dotfiles
  if [ $SKIP_DOTFILES -ne 1 ]; then
    [ $VERBOSE == 1 ] && echo -e "\tDotfiles: $status_installing"
  else
    [ $VERBOSE == 1 ] && echo -e "\tDotfiles: $status_skipped"
  fi

  [ $VERBOSE == 1 ] && printf "\n"
}


install() {

  [ $SKIP_PACKAGES -ne 1 ] && {
    [ $VERBOSE == 1 ] && echo "Installing packages"
    # install packages
  }

  [ $SKIP_DOTFILES -ne 1 ] && {
    [ $VERBOSE == 1 ] && echo "Installing Zsh"
    SYM_CHECK_ONLY=0
    check_or_create_symlinks
  }

}


uninstall() {
  echo "Uninstalling..."
}


main() {
  set_custom_tabs
  detect_platform

  case $1 in

    ""|-h|--help)
      usage
      ;;

    symcheck)
      check_or_create_symlinks
      ;;

    install)
      shift
      check_skipped $@
      install
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
exit 0


