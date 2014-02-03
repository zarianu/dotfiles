if [ -e .profile ] ; then source .profile ; fi

## prompts
#
RPROMPT='%F{yellow}%~%f'
if [[ `hostname` = "kost-mac" ]] ; then PROMPT='[%n@%F{green}%m%f]%# ' ;
else PROMPT='[%n@%F{red}%m%f]%# '; fi
setopt TRANSIENT_RPROMPT

## history
#
HISTSIZE=1024
HISTFILE=~/.zsh_history
SAVEHIST=1024
setopt INC_APPEND_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_REDUCE_BLANKS \
  HIST_SAVE_NO_DUPS SHARE_HISTORY HIST_NO_STORE HIST_IGNORE_DUPS \
  HIST_IGNORE_SPACE
alias h=history



## searches DNS nms.local zone for pattern
#
alias d=dns_search
dns_search() {
  grep -i $1 /etc/namedb/master/nms.local.db
}

alias p=ping
alias s=ssh
alias ls='ls -G'
alias g=git
