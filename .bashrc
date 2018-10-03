export HISTFILESIZE=100000
export HISTSIZE=100000
export EDITOR=vim
alias grep='grep --color'                     # show differences in colour

case "$(uname)" in

    Darwin) # OSがMacならば
        alias du='du -sh * | gsort -h | tail -n15'
        export ANDROID_HOME=~/Library/Android/sdk
        export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
        export PATH=~/Library/Android/sdk/tools:$PATH
        export PATH=~/Library/Android/sdk/platform-tools:$PATH
        alias ls='ls -G'
        alias ll='ls -lG'
        alias la='ls -laG'
        ;;

    *)
        alias la='ls -A'                              # all but . and ..
        alias la='ls -al'       # show hidden files
        alias ld='ls -ld .??*'
        alias lk='ls -lSr'      # sort by size
        alias ll='ls -alF'
        alias l='ls -CF'                              #
        alias lm='ls -al |more'     # pipe through 'more'
        alias lr='ls -lR'       # recursice ls
        alias lsdot='ls -ld $HOME/.[A-Za-z0-9]*'
        alias lt='ls -ltr'      # sort by date
        alias lx='ls -lX'      # sort by extension
      ;;
esac

function mkill {
    ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs -I{} sudo kill -9 {}
}

alias wget='wget -nd'
alias wgetr='wget -r -l5 -np'
export TZ='America/Los_Angeles'

function ipa {
    ifconfig | awk -F '[: ]+' '/inet addr:/ { if (!($4 == "127.0.0.1" || $4 ~ /192/)) print $4 }'
}

[ -s "~/.scm_breeze/scm_breeze.sh" ] && source "~/.scm_breeze/scm_breeze.sh"

[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
