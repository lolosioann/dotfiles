# .zshrc
# This file is sourced by zsh when a new shell is started.

# added by p10k, must stay at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Enable zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"


# ------- SOURCE ALIASES -------
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases.zsh"


# ----- PLUGINS ------
zinit ice depth 1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light fdellwing/zsh-bat
zinit light zshzoo/cd-ls


# ------- SNIPPETS -------
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# ----- COMPLETIONS -----
autoload -U compinit && compinit
autoload -U colors && colors
zinit cdreplay -q
# case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
_comp_options+=(globdots) # show hidden files in completions

# -------- HISTORY --------
HISTSIZE=5000
HISTFILE=${XDG_DATA_HOME:-$HOME/.local}/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ---------- VIM MODE ----------
bindkey -v
export KEYTIMEOUT=5
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line


# ---------- MISC ------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"

# change directory using yazi
ycd () {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
bindkey -s "^y" "ycd\n"

# source .p10k.zsh for p10k config
[[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh ]] || source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh
setopt autocd

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
