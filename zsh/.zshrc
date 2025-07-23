if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
ZSH_COMPDUMP=${XDG_CACH_HOME:-$HOME/.cache}/zsh/zcompdump

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)" 
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Theme
zinit ice depth 1; zinit light romkatv/powerlevel10k

#addons
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light fdellwing/zsh-bat
zinit light zshzoo/cd-ls

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit
# cache compinit for performance
zinit cdreplay -q


alias ls='eza'
alias spicetify='${XDG_CONFIG_HOME:-$HOME/config}/spicetify/spicetify'
alias gs='git status --short'
alias gl="git log --all --graph"

# History
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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# source p10k
[[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh ]] || source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh


export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export CLUTTER_BACKEND=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto
