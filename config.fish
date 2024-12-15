set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x TERM xterm-256color
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -x RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
zoxide init fish | source
starship init fish | source

abbr -a gdh 'git diff HEAD^'
abbr -a gprv 'gh pr view --web'
abbr -a tl 'tmuxp load -y'
abbr -a opr 'op run --'
abbr -a oprn 'op run --no-masking --'
abbr -a myip 'ipconfig getifaddr en0'
