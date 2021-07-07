#!/usr/bin/env bash


. "$SCRIPT_PATH/symlinker-config.sh"


# TODO: Unused
create_symlink() {
  sym_src=$1
  sym_dest=$2

  if [ $FORCE == 1 ]; then
    [ $VERBOSE == 1 ] && echo "Force link for $sym_src"
  else
    [ $VERBOSE == 1 ] && echo "Soft link for $sym_src"
  fi
}


check_symlinks() {
  [ $VERBOSE == 1 ] && {
    tabs 2
    printf "\nSymlink status:\n\n"
  }

  for file in $SCRIPT_PATH/../*; do
    if [ -v symlinks["$(basename $file)"] ]; then
      symlink_dest=${symlinks["$(basename $file)"]}

      if [ -L "$symlink_dest" ]; then
        if [ -e "$symlink_dest" ]; then
          symlink_status="${GREEN}GOOD${RESET}"
        else
          symlink_status="${RED}BROKEN${RESET}"
        fi
      else
        symlink_status="${YELLOW}NONE${RESET}"
      fi

      [ $VERBOSE == 1 ] && echo -e "\t${PURPLE}$(basename $file)${RESET} -> $symlink_dest: $symlink_status"
    fi
  done

  [ $VERBOSE == 1 ] && printf "\n"
}


