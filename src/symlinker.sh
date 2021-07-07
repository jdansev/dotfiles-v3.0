#!/usr/bin/env bash


. "$SCRIPT_PATH/symlinker-config.sh"


print_symlink_status() {
  file=$1
  symlink_dest=$2

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
}


check_or_create_symlinks() {
  [ $VERBOSE == 1 ] && {
    tabs 2
    printf "\nSymlink status:\n\n"
  }

  for file in $SCRIPT_PATH/../*; do
    if [ -v symlinks["$(basename $file)"] ]; then

      symlink_dest=${symlinks["$(basename $file)"]}
      print_symlink_status $file $symlink_dest

      real_symlink_dest=$(readlink -f ${symlinks["$(basename $file)"]})
      real_file=$(readlink -f $file)

      if [ $SYM_CHECK_ONLY -ne 1 ]; then
        if [ -d "$symlink_dest" ]; then

          target_path=$symlink_dest
          # echo $target_path

          # TODO: Resolve overwriting existing directories with symlink
          # sudo ln -sf $(readlink -f $file) $symlink_dest

        else
          sudo ln -sf $file $symlink_dest
        fi
      fi

      # TODO: Before and after check of link statuses

    fi
  done

  [ $VERBOSE == 1 ] && printf "\n"
}


