PS1='%B%{$fg[magenta]%}%M %{$fg[blue]%}%c%{$fg[magenta]%}%%%{$reset_color%} '
RPS1="${RPS1}"'%{$fg_bold[red]%}%(?..%?)%{$reset_color%}'

source $ZSH/oh-my-zsh.sh

HISTSIZE=1000
SAVEHIST=1000

source /home/jozan/Packages/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

alias c='clear'
alias bc='clear; bc'
alias emacs='TERM=xterm-256color emacs -nw'
alias msfconsole='TERM=xterm-256color msfconsole'
