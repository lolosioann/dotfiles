# ---- ZSH ENVIRONMENT VARS ----
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
GOPATH=${XDG_DATA_HOME:-$HOME/.local/share}/go

# ----- DEFAULT PROGRAMS -----
export EDITOR="nvim"
export BROWSER="zen-browser"


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
)
typeset -U path
export PATH="$PATH"


