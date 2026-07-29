export LANG="en_US.UTF-8"

typeset -U path PATH
typeset -U fpath

export PROMPT="%F{255}%K{160}%n %f%k%F{160}%K{220}"$'\UE0B0'"%f%k%F{19}%K{220} %20<…<%~%<< %f%k%F{220}"$'\UE0B0'"%f "
# color {9} is red, can be changed to {39} blue
# See all colors:
# for c in {0..255}; do print -P "%K{$c}%F{black} ${c} %f%k"; done
if [[ -z ${HOMEBREW_PREFIX:-} ]] && (( $+commands[brew] )); then
    export HOMEBREW_PREFIX="$("${commands[brew]}" --prefix)"
fi

if [[ -n ${HOMEBREW_PREFIX:-} ]]; then
    export BREW_PREFIX="$HOMEBREW_PREFIX"
    export CFLAGS="-I$HOMEBREW_PREFIX/include"
    export LDFLAGS="-L$HOMEBREW_PREFIX/lib"
    export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig"

    if [[ -d "$HOMEBREW_PREFIX/opt/bison/bin" ]]; then
        path=("$HOMEBREW_PREFIX/opt/bison/bin" "${path[@]}")
    fi

    if [[ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]]; then
        fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
    fi
fi

export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait -a ''"
autoload -Uz compinit && compinit

if [[ -n ${HOMEBREW_PREFIX:-} &&
      -r "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
alias brew-up='brew update && brew upgrade -y'
alias opam-up='opam update --upgrade'
function opam-set() {
    if [[ -z "$1" ]]; then
        opam switch
        return
    fi

    unset OPAMSWITCH
    OPAMNOENVNOTICE=true opam switch set "$1" &&
        eval "$(opam env)"
}

function _opam_set() {
    local -a switches

    case "$CURRENT" in
        2)
            switches=("${(@f)$(OPAMNOENVNOTICE=true opam switch list --short 2>/dev/null)}")
            compadd -- "${switches[@]}"
            ;;
        *)
            _message "no more arguments"
            ;;
    esac
}

(( $+functions[compdef] )) && compdef _opam_set opam-set
alias rsbcl='rlwrap sbcl'
alias rgpdf='rga --type pdf'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if [[ -d "$PYENV_ROOT/bin" ]]; then
    path=("$PYENV_ROOT/bin" "${path[@]}")
fi
if (( $+commands[pyenv] )); then
    eval "$("${commands[pyenv]}" init - zsh)"
fi
if (( $+commands[direnv] )); then
    eval "$("${commands[direnv]}" hook zsh)"
fi

get_session_ppid() {
    local pid=$$
    while true; do
        local parent=$(ps -o ppid= -p "$pid" 2>/dev/null | tr -d ' ')
        if [[ -z "$parent" || "$parent" -eq 1 ]]; then
            break
        fi
        pid=$parent
    done
    echo "$pid"
}

if (( $+commands[fastfetch] )); then
    SESSION_ROOT_PID=$(get_session_ppid)
    MARK_FILE="${XDG_RUNTIME_DIR:-/tmp}/.fastfetch_shown_${USER}_${SESSION_ROOT_PID}"

    if [[ $- == *i* ]] && [[ ! -f "$MARK_FILE" ]]; then
        touch "$MARK_FILE"
        "${commands[fastfetch]}"
    fi
fi

# Mole shell completion
if (( $+commands[mole] )); then
    if _mole_completion="$("${commands[mole]}" completion zsh 2>/dev/null)"; then
        eval "$_mole_completion"
    fi
    unset _mole_completion
fi

# Emacs shell-mode / comint only. Do not affect vterm.
if [[ "$TERM" == "dumb" || "$INSIDE_EMACS" == *comint* ]]; then
  PROMPT='%n:%~%# '
  RPROMPT=''
  SPROMPT=''
  unsetopt prompt_cr prompt_sp
fi
