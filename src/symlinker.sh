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

      # /root/ path when using sudo on Debian
      symlink_dest=${symlinks["$(basename $file)"]}

      print_symlink_status $file $symlink_dest

      real_symlink_dest=$(readlink -f ${symlinks["$(basename $file)"]})
      real_file=$(readlink -f $file)

      if [ $SYM_CHECK_ONLY -ne 1 ]; then
        if [ -d "$symlink_dest" ]; then

          # move with temporary name
          sudo ln -sf $real_file "${symlink_dest}.tmp"

          # replace the old backup if exists
          if [ $BACKUPS == 'hard' ]; then
            if [ -d "${symlink_dest}.bak" ]; then
              rm -rf "${symlink_dest}.bak"
            fi
            mv $symlink_dest "${symlink_dest}.bak"

          # make a new backup only if no existing backups exist
          elif [ $BACKUPS == 'soft' ]; then
            if [ ! -e "${symlink_dest}.bak" ]; then
              mv $symlink_dest "${symlink_dest}.bak"
            fi
            # delete the original
            rm -rf $symlink_dest
          fi

          # remove temporary name
          mv "${symlink_dest}.tmp" $symlink_dest

        else
          sudo ln -sf $real_file $symlink_dest
        fi

      fi

      # TODO: Before and after check of link statuses

    fi
  done

  [ $VERBOSE == 1 ] && printf "\n"
}


