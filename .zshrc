export TERM=xterm-256color-italic
export NVM_LAZY_LOAD=true
export VISUAL=nvim
export EDITOR=$VISUAL
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/ripgreprc"
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
antigen bundle fzf
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle docker
antigen bundle docker-compose

alias fd=fdfind
alias tdi="td --interactive"
alias aerc="TERM=xterm-256color aerc"
alias vg="nvim +GhostStart"
alias gprv="gh pr view --web"

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# no_share_history is better for tmux
setopt no_share_history
setopt CORRECT

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
# TODO: remove virtualenvwrapper settings after direnv migration finished
export WORKON_HOME="$HOME/.local/share/virtualenvs"
alias pyv="pyenv virtualenvwrapper"
function wk() { pyenv virtualenvwrapper && workon $(basename $(pwd)) }

# weather
alias wttr="curl wttr.in"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"
alias dr="direnv reload"

alias tl="tmuxp load"

if [[ -a ~/.personal.after.rc ]]; then
  source ~/.personal.after.rc
fi

