# prompt
autoload -U colors && colors

# history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$XDG_CONFIG_HOME/zsh/history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# completions
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode and key bindings
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v "^?" backward-delete-char
bindkey -v "^[[A" history-beginning-search-backward
bindkey -v "^[[B" history-beginning-search-forward
bindkey -v "^K" history-beginning-search-backward
bindkey -v "^J" history-beginning-search-forward
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward

# edit command line
autoload edit-command-line && zle -N edit-command-line
bindkey "^e" edit-command-line

# Shared history
setopt inc_append_history
setopt share_history

# OBS
# if [ -z "$XDG_RUNTIME_DIR" ]; then
# 	export XDG_RUNTIME_DIR="/tmp/${USER}"
# 	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
# 		mkdir "$XDG_RUNTIME_DIR"
# 		chmod 0700 "$XDG_RUNTIME_DIR"
# 	fi
# fi

# alias and plugins
[ -f "$XDG_CONFIG_HOME/zsh/alias.zsh" ]		&& source $ZDOTDIR/alias.zsh
[ -f "$XDG_CONFIG_HOME/zsh/plugins.zsh" ]	&& source $ZDOTDIR/plugins.zsh

PROMPT="%B%{$fg[red]%}%M %{$fg[blue]%}%c%{$fg[red]%}%%%{$reset_color%} "
RPROMPT="${RPROMPT}"'%{$fg_bold[red]%}%(?..%?)%{$reset_color%} $(gitprompt)'
