# ▒███████▒  ██████  ██░ ██  ██▀███   ▄████
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
# ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░
#   ░ ░          ░   ░  ░  ░   ░     ░ ░
# ░                                  ░

# 256 colour support #######################################
export TERM="xterm-256color"
############################################################

# Set locale ###############################################
export LC_ALL=en_US.UTF-8
############################################################

# Set editor ###############################################
export EDITOR=nvim
############################################################

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# List directories when directory is changed
chpwd() {
    eza -a --icons always
}

# Plugins ####################################################
ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_UPDATE=true

source "${HOME}/.zgenom/zgenom.zsh"

if ! zgenom saved; then
    zgenom ohmyzsh

    zgenom ohmyzsh plugins/autojump
    zgenom ohmyzsh plugins/colored-man-pages
    zgenom ohmyzsh plugins/extract

    zgenom load hlissner/zsh-autopair
    zgenom load z-shell/F-Sy-H
    zgenom load romkatv/zsh-defer
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load zsh-users/zsh-completions

    zgenom load romkatv/powerlevel10k powerlevel10k

    zgenom save
fi
##############################################################

# Powerlevel10k configs ######################################
source $HOME/.p10k.zsh
#############################################################

## Autosuggestions config ##################################
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585b70"
# Disables lag
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
############################################################

## Autopair config #########################################
zvm_after_init_commands=(autopair-init)
AUTOPAIR_INIT_INHIBIT=1
############################################################

## Vi mode config ##########################################
ZVM_VI_HIGHLIGHT_BACKGROUND=#585b70
ZVM_VI_HIGHLIGHT_FOREGROUND=#b4befe
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
############################################################

## Vi-Mode ZSH #############################################
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
############################################################

## ZSH substring search ####################################
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=0,fg=green,underline"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""

bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

zvm_after_init() {
    bindkey '^[OA' history-substring-search-up
    bindkey '^[OB' history-substring-search-down
}
############################################################

## Fix tmux comment highlighting on vim ####################
[ ! -z "${TMUX+x}" ] && export TERM="screen-256color"
############################################################

## Additional stuff ########################################
export PATH=$PATH:/home/$USER/.local/bin
source $HOME/.zsh_profile
############################################################

# vim: ft=bash
