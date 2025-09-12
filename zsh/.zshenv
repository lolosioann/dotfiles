# ---- ZSH ENVIRONMENT VARS ----
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
GOPATH=${XDG_DATA_HOME:-$HOME/.local/share}/go

# ----- DEFAULT PROGRAMS -----
export EDITOR="nvim"
export BROWSER="zen-browser"

# ----- Matplotlib backend ------
export MPLBACKEND=TkAgg  

# ------ FIX SOME HYPRLAND ISSUES ------
# These are needed for some applications to work properly under Wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export CLUTTER_BACKEND=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto


# ------ PATH ------
path=(
    $PATH
    $HOME/.local/bin
    "$XDG_CONFIG_HOME/scripts"
    "$XDG_CONFIG_HOME/spicetify"
    "$HOME/.cargo/bin"
)
typeset -U path
export PATH="$PATH"

# fzf catppuccin mocha theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
