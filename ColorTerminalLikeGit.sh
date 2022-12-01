# git branch info if present
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u@\h\[\033[00m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\[\033[1;31m\]>>\[\033[00m\] "