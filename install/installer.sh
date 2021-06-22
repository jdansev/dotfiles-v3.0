#!/bin/bash


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


colorme


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





