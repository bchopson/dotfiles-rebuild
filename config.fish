set -g fish_greeting

# Created by `pipx` on 2023-04-21 02:48:00
fish_add_path ~/.local/bin

# Rust
fish_add_path ~/.cargo/bin


if test (uname) = Darwin
    # Evaluate Homebrew environment setup
    /opt/homebrew/bin/brew shellenv | source

    # Postgres
    fish_add_path /Library/PostgreSQL/17/bin
    # Setting PATH for Python 3.12
    fish_add_path /Library/Frameworks/Python.framework/Versions/3.12/bin
    # Added by OrbStack: command-line tools and integration
    if test -f ~/.orbstack/shell/init.fish
        source ~/.orbstack/shell/init.fish
    end
end

# Start tmux automatically if not already inside a tmux session
if status is-interactive
    if not set -q TMUX
        if tmux has-session
            tmux attach-session
        else
            tmux new-session
        end
    end
end

set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x TERM xterm-256color
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -x RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
set -x ANSIBLE_ROLES_PATH ~/code/work/ansible-roles/

abbr -a gdh 'git diff HEAD^'
abbr -a gprv 'gh pr view --web'
abbr -a tl 'tmuxp load -y'
abbr -a opr 'op run --'
abbr -a oprn 'op run --no-masking --'
abbr -a myip 'ipconfig getifaddr en0'

if test (uname) != Darwin
    alias fd=fdfind
end

if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end

zoxide init fish | source
starship init fish | source
