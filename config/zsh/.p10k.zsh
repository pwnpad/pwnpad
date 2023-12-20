'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  autoload -Uz is-at-least && is-at-least 5.1 || return

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

  # Left prompt segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    anaconda
    virtualenv
    ssh
    user_joined
    dir
    vcs
    newline
    my_cpu_arch_joined
    prompt_char_joined
  )

  # Right prompt segments.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    background_jobs
    my_aslr_status
    date
    time_joined
  )

  typeset -g POWERLEVEL9K_MODE="nerdfont-complete"

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  typeset -g POWERLEVEL9K_STATUS_VERBOSE=false
  typeset -g POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""

  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=""
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE="true"

  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND="3"
  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND="26"

  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="3"
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="26"

  typeset -g POWERLEVEL9K_USER_DEFAULT_FOREGROUND="7"
  typeset -g POWERLEVEL9K_USER_DEFAULT_BACKGROUND="8"

  typeset -g POWERLEVEL9K_SSH_FOREGROUND="11"
  typeset -g POWERLEVEL9K_SSH_BACKGROUND="8"

  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND="0"
  typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="0"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="0"
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="11"

  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND="15"
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=""

  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=""
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="6"
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="0"

  typeset -g POWERLEVEL9K_DATE_FORMAT="7"
  typeset -g POWERLEVEL9K_DATE_FORMAT="%D{%d-%b-%y}"

  typeset -g POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

  function prompt_my_aslr_status() {
    [[ $ASLR_DISABLE == 1 ]] && p10k segment -b 9 -f 0 -i $'\uF074 ' -t 'ASLR' || \
      p10k segment -b 10 -f 0 -i $'\uF074 ' -t 'ASLR'
  }

  function prompt_my_cpu_arch() {
    [[ -z "$ARCH" ]] && export ARCH=$(uname -m)

    [[ "$ARCH" = "aarch64" ]] &&  p10k segment -b '' -f 15 -i $'\uF303' -t 'rm' || \
      p10k segment -b '' -f 15 -i $'\uF303' -t 'md'
  }

  function p10k-on-pre-prompt() {
    p10k display '1'=show 'empty_line'=hide '*/load'=show '*/ram'=show '*/wifi'=show
  }
  function p10k-on-post-prompt() {
    [[ $P9K_TTY == old ]] && p10k display '1'=hide 'empty_line'=show '*/load'=hide '*/ram'=hide '*/wifi'=hide
  }

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
