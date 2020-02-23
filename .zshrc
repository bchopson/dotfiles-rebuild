export TERM=xterm-256color-italic
export NVM_LAZY_LOAD=true
export VISUAL=nvim
export EDITOR=$VISUAL
export FZF_DEFAULT_COMMAND='ag -g ""'
# Up arrow history completion
export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
function fzfx() { fzf --print0 | xargs -0 xdg-open }

__git_files () {
    _wanted files expl 'local files' _files
}

source $HOME/dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle tmux
antigen bundle ssh-agent
antigen bundle vi-mode
antigen bundle lukechilds/zsh-nvm
antigen bundle virtualenvwrapper
# antigen bundle fzf

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

if [[ -a ~/.personal.after.rc ]]; then
  source ~/.personal.after.rc
fi

setopt no_share_history

export PATH="/home/ben/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
