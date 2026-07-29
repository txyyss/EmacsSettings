export PROMPT="%F{255}%K{160}%n %f%k%F{160}%K{220}"$'\UE0B0'"%f%k%F{19}%K{220} %20<…<%~%<< %f%k%F{220}"$'\UE0B0'"%f "
# color {9} is red, can be changed to {39} blue
# See all colors:
# for c in {0..255}; do print -P "%K{$c}%F{black} ${c} %f%k"; done
export BREW_PREFIX=$(brew --prefix)
export CFLAGS="-I$BREW_PREFIX/include"
export LDFLAGS="-L$BREW_PREFIX/lib"
export PKG_CONFIG_PATH="$BREW_PREFIX/lib/pkgconfig"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export LANG="en_US.UTF-8"
export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait -a ''"
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit && compinit

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

compdef _opam_set opam-set
alias rsbcl='rlwrap sbcl'
alias rgpdf='rga --type pdf'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(direnv hook zsh)"

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

SESSION_ROOT_PID=$(get_session_ppid)
MARK_FILE="${XDG_RUNTIME_DIR:-/tmp}/.fastfetch_shown_${USER}_${SESSION_ROOT_PID}"

if [[ $- == *i* ]] && [[ ! -f "$MARK_FILE" ]]; then
    touch "$MARK_FILE"
    fastfetch
fi

# Mole shell completion
if output="$(mole completion zsh 2>/dev/null)"; then eval "$output"; fi

# Emacs shell-mode / comint only. Do not affect vterm.
if [[ "$TERM" == "dumb" || "$INSIDE_EMACS" == *comint* ]]; then
  PROMPT='%n:%~%# '
  RPROMPT=''
  SPROMPT=''
  unsetopt prompt_cr prompt_sp
fi
