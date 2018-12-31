export TERM=xterm-256color-italic

source $HOME/dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle tmux
antigen bundle ssh-agent
antigen bundle vi-mode

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

if [[ -a ~/.personal.after.rc ]]; then
  source ~/.personal.after.rc
fi
