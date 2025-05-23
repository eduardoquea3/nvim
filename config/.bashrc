eval "$(fnm env --use-on-cd --shell bash)"

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
alias sa='spicetify apply'
alias su='spicetify update'
alias sb='spicetify backup apply'
alias bi='brave --incognito'
alias n='nvim'
alias pd='podman'

bind '"\C-e":"\C-m"'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
