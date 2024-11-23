export ZSH="$HOME/.oh-my-zsh"
eval "$(starship init zsh)"

# ZSH_THEME="robbyrussell"
ZSH_THEME=""

plugins=(
	git
	archlinux
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

alias ns="nvim ~/.zshrc"
alias ss="source ~/.zshrc"
alias ls="eza --icons"
alias la="eza -a --icons"
alias lg="lazygit"

# pnpm
export PNPM_HOME="/home/eduardo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

bindkey "^E" "accept-line"

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun completions
[ -s "/home/eduardo/.bun/_bun" ] && source "/home/eduardo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
