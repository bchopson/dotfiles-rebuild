source $HOME/dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply
