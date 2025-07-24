# eval "$(fnm env --use-on-cd --shell bash)"

export EDITOR=nvim
export VISUAL=nvim

case $- in
  *i*) ;;
    *) return;;
esac

export OSH='/c/Users/eduar/.oh-my-bash'

OSH_THEME=""

OMB_USE_SUDO=true

completions=(
  git
  composer
  ssh
)
aliases=(
  general
)
plugins=(
  git
  bashmarks
  starship
  zoxide
)

source "$OSH"/oh-my-bash.sh

alias cls='clear'
alias ls='eza --icons'
alias ll='eza --icons -l'
alias lla='eza --icons -l -A'
alias la='eza --icons -A'
alias ns='nvim ~/.bashrc'
alias ss='source ~/.bashrc'
alias lg='lazygit'
alias ld='lazydocker'
alias sa='spicetify apply'
alias su='spicetify update'
alias sb='spicetify backup apply'
alias bi='brave --incognito'
alias n='nvim'
alias pd='podman'
alias wl='wsl -l -v'
alias si="scoop install"
alias srm="scoop uninstall"
alias su="scoop update"

bind '"\C-e":"\C-m"'

# function y() {
# 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
# 	yazi "$@" --cwd-file="$tmp"
# 	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
# 		builtin cd -- "$cwd"
# 	fi
# 	rm -f -- "$tmp"
# }

y() {
    os=$(uname -s)

    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    elif [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    elif [[ "$os" =~ MINGW|MSYS|CYGWIN ]]; then
        export SPF_LAST_DIR="$LOCALAPPDATA/superfile/lastdir"
    else
        echo "Sistema no reconocido: $os" >&2
        return 1
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}
