# ---- ZSH ENVIRONMENT VARS ----
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
ZSH_COMPDUMP=${XDG_CACH_HOME:-$HOME/.cache}/zsh/zcompdump


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
# export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
path=(
    $PATH
    "$XDG_CONFIG_HOME/scripts"
    "$XDG_CONFIG_HOME/spicetify"
)
typeset -U path
export PATH="$PATH"
