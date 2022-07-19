export VISUAL=nvim
export EDITOR=$VISUAL
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/ripgreprc"
export ZSH_TMUX_AUTOSTART=true
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
antigen bundle fzf
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle docker
antigen bundle docker-compose

LIGHT_COLOR="gruvbox_light.yaml"
DARK_COLOR="oak.yml"

alias day="alacritty-colorscheme apply $LIGHT_COLOR"
alias night="alacritty-colorscheme apply $DARK_COLOR"
alias toggle="alacritty-colorscheme toggle $LIGHT_COLOR $DARK_COLOR"

alias fd=fdfind
alias aerc="TERM=xterm-256color aerc"
alias vg="nvim +GhostStart"
alias gprv="gh pr view --web"
alias pm="playerctl metadata"
alias wttr="curl wttr.in"

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# no_share_history is better for tmux
setopt no_share_history
setopt CORRECT

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"
alias dr="direnv reload"

alias tl="tmuxp load -y"

if [[ -a ~/.personal.after.rc ]]; then
  source ~/.personal.after.rc
fi

# setup funky
command -v funky &>/dev/null && eval "$(funky --init zsh)"

# fnm
export PATH=/home/ben/.fnm:$PATH
eval "`fnm env`"

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
