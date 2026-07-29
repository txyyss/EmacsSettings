typeset -U path PATH
typeset -U fpath

_dotfiles_brew=
if (( $+commands[brew] )); then
    _dotfiles_brew="${commands[brew]}"
elif [[ -x /opt/homebrew/bin/brew ]]; then
    _dotfiles_brew=/opt/homebrew/bin/brew
elif [[ -x /usr/local/bin/brew ]]; then
    _dotfiles_brew=/usr/local/bin/brew
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    _dotfiles_brew=/home/linuxbrew/.linuxbrew/bin/brew
fi

if [[ -n "$_dotfiles_brew" ]]; then
    eval "$("$_dotfiles_brew" shellenv)"
fi
unset _dotfiles_brew

if (( $+commands[opam] )); then
    eval "$("${commands[opam]}" env)"
fi

if [[ -d "$HOME/.elan/bin" ]]; then
    path=("$HOME/.elan/bin" "${path[@]}")
fi
