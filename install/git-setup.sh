#!/bin/bash

# https://github.com/colbycheeze/dotfiles/blob/master/setup/pre-setup.sh


if [ -z "$SSH_AUTH_SOCK" ]; then
  echo "Status: no ssh-agent running."
else
  echo "Status: ssh-agent is running."
fi

echo "Setting up GitHub SSH key pairs."

echo "Please enter your github email:"
read github_email
ssh-keygen -t rsa -b 4096 -C $github_email

echo "Starting ssh-agent in the background."
eval "$(ssh-agent -s)"

echo "Adding your SSH key to ssh-agent"
ssh-add

echo "Add key to GitHub to finish setup."

cat $HOME/.ssh/id_rsa.pub

# eval $(ssh-agent -k) # kill the process


