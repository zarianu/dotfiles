if [ -e .profile ] ; then source .profile ; fi

## completions
#
compctl -f -k "( `cat .ssh/config| grep "^Host " | cut -f 2 -d ' ' | tail -n +2`)" ssh scp

## prompts
#
RPROMPT='%F{yellow}%~%f'
if [[ `hostname -s` = "kost-mac" || `hostname -s` = "buku" ]] ; then PROMPT='[%n@%F{green}%m%f]%# ' ;
else PROMPT='[%n@%F{red}%m%f]%# '; fi
setopt TRANSIENT_RPROMPT

## history
#
HISTSIZE=1024
HISTFILE=~/.zsh_history
SAVEHIST=1024
setopt INC_APPEND_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_REDUCE_BLANKS \
  HIST_SAVE_NO_DUPS SHARE_HISTORY HIST_NO_STORE HIST_IGNORE_DUPS \
  HIST_IGNORE_SPACE CORRECT
alias h=history



## searches DNS nms.local zone for pattern
#
alias d=dns_search
dns_search() {
  grep -i $1 /etc/namedb/master/nms.local.db
}

alias p=ping
alias s=ssh
alias t=tmux
alias ls='ls -G'
alias g=git

## generate random password
#
alias gp=genpasswd
genpasswd() {
  if (( $# == 1 )); then
    cat /dev/urandom | grep -aio "[0-9a-z]" | head -n $1 | tr -d '\n'; echo
  else
    echo "Usage: genpasswd <length>"
  fi  
}

if [ $(uname) = Darwin ]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Some Brew dirty hack
fi

