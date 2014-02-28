## Aliases
alias c='clear'
alias la='ls -la'
alias ll='ls -l'
alias l='ls -laAhF'
alias dir='ls -a'

## Returns the active branch of the current directory. Used by PS1
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

## Make cd fancy
cd() {
    if [[ $@ == '-' ]]; then
        builtin cd "$@" > /dev/null  # We'll handle pwd.
    else
       builtin cd "$@"
    fi
    echo -e "   \033[1;30m"`pwd`"\033[0m"
}

## We'll call this cd, clear and dir
function cl () {
  cd "$@" && clear && ls -lah
}

## Gimme some envs
export JAVA_HOME="$(/usr/libexec/java_home)"
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master


## Make the slug line fancy too
export PROMPT_DIRTRIM='2' #only works with bash 4.x
# Color variables
RED="\[\033[1;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
PURPLE="\[\033[1;35m\]"
BLUE="\[\033[0;34m\]"
TIME="[\t]"
DIRNAME="\w"
export PS1="[$PURPLE\D{%H:%M}$WHITE][$BLUE\h$WHITE]$GREEN\$(parse_git_branch)$WHITE:$RED\W$WHITE/ $ "
