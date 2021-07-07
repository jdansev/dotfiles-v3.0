
export ZSH=$HOME/.oh-my-zsh

# resolves zsh-autosuggestion colorization issues in tmux
export TERM=xterm-256color

# ansible binaries
export PATH=$PATH:$HOME/.local/bin

# theme
ZSH_THEME="agnoster"

# plugins
plugins=(
  git
  k
  zsh-autosuggestions
  zsh-z
)

# apply changes
source $ZSH/oh-my-zsh.sh

# vi-mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=false
MODE_INDICATOR="%F{yellow}[vi-mode]%f"

# aliases

## navigation
alias l='ls -lha'
alias c='clear'
alias p='pwd'
alias h='history'

## zsh
alias zup='zshupdate'
alias zshthemes='cd $ZSH/themes'
alias zshcustom='cd $ZSH_CUSTOM'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'

## k
alias k='k --all'

## calendar
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

## git
alias gst='git status'
alias gp='git push'
alias gpl='git pull'
alias grh='git reset --hard'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcv='git commit -v'
alias gc='git_quick_commit'

function git_quick_commit() {
  printf 'Commit message: '
  read commit_message
  echo $commit_message
  gaa && gcm "$commit_message" && gp
}

## node
alias ys='yarn start'

## custom
alias myip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias reload='clear && source $HOME/.zshrc'
alias r='reload'
alias n="$EDITOR \`fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:65%\`"

# activate python virtual environment
alias activate='activate_virtualenv'
function activate_virtualenv() {
  if [ -f 'bin/activate' ]; then
    source bin/activate
    echo 'Activated.'
  else
    echo 'bin/activate not found.'
  fi
}


# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim

## set neovim as default editor
export EDITOR=nvim
export VISUAL='$EDITOR'

## vim-plug installation
curl -fl --silent --output ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# grant permissions to zshupdate
chmod +x /usr/local/bin/zshupdate

# reload
cd $HOME
clear
neofetch

# env vars
export DOTFILES_PATH=/home/jdansev/my-dotfiles
export PACKAGES_PATH=/home/jdansev/zsh-packages


