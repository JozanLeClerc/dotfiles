#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export VISUAL="vim"

export PS1="\[\e[01;34m\][\[\e[0m\]\[\e[01;34m\]\u\[\e[0m\]\[\e[01;34m\]@\[\e[0m\]\[\e[01;34m\]\h\[\e[0m\]\[\e[00;37m\]\[\e[0m\]\[\e[01;35m\] \W\[\e[01;34m\]]\[\e[00;37m\]\\$ \[\e[0m\]"

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

