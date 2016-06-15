if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
	source ~/.zsh/antigen/antigen.zsh

	antigen use oh-my-zsh

	antigen theme essembeh

	antigen bundle zsh-users/zsh-syntax-highlighting #highlight
	antigen bundle git #git
	antigen bundle zsh-users/zsh-history-substring-search #history search
	antigen bundle mollifier/anyframe #peco
	antigen bundle command-not-found #
	antigen bundle b4b4r07/enhancd #jump
	antigen bundle zsh-users/zsh-completions #コマンド補完

	antigen apply
fi

#-----------------------------------------------------------
# 環境
#-----------------------------------------------------------
umask 0002

setopt no_check_jobs #exitでジョブを終了しない
setopt complete_aliases
setopt noautoremoveslash
setopt list_packed
setopt nolistbeep
setopt auto_cd  #direcotry名だけでcd
setopt auto_pushd
setopt correct
setopt multios  #multios

export LANG=ja_JP.UTF-8
export PATH=$HOME/bin:/usr/local/bin:/sbin:$PATH

#-----------------------------------------------------------
# keyborad
#-----------------------------------------------------------
#vi mode
bindkey -v

#----------------------------------------------------------
# zsh-completions
#----------------------------------------------------------
#補完候補を矢印で選択
zstyle ':completion:*:default' menu select=1

#----------------------------------------------------------
# color
#----------------------------------------------------------
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

eval `dircolors ~/.dircolors`

#-----------------------------------------------------------
# HISTROY
#-----------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

##-----------------------------------------------------------
## alias
##-----------------------------------------------------------
alias tree='tree -NC'

#-----------------------------------------------------------
# enhancd jump移動
#-----------------------------------------------------------
export ENHANCD_FILTER="/usr/local/bin/peco:fzf:non-existing-filter"

#-----------------------------------------------------------
# anyframe peco
#-----------------------------------------------------------
zstyle ":anyframe:selector:" use peco
#zstyle ":anyframe:selector:peco:" command "peco --rcfile=${HOME}/.peco_config.json"

bindkey '^B' anyframe-widget-checkout-git-branch
bindkey '^G' anyframe-widget-insert-git-branch
bindkey '^R' anyframe-widget-execute-history
bindkey '^F' anyframe-widget-insert-filename

#-----------------------------------------------------------
# history-substring-seach
#-----------------------------------------------------------
autoload history-search-end
bindkey "^P" history-substring-search-down
bindkey "^N" history-substring-search-up

#-----------------------------------------------------------
# anyenv
#-----------------------------------------------------------
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#-----------------------------------------------------------
# peco git-issue
#-----------------------------------------------------------
function peco-issue () {
 for num in `git issue mine | peco | awk '{ print $1 }' | cut -c 2-`
 do
  git issue $num
 done
}
zle -N peco-issue
bindkey "^K" peco-issue


function peco-issue-number () {
	 git issue mine \
	 | anyframe-selector-auto \
   | awk '{ print "refs "$1 }' \
	 | anyframe-action-insert
}
zle -N peco-issue-number
bindkey "^O" peco-issue-number

#-----------------------------------------------------------
# peco git-tree
#-----------------------------------------------------------
function peco-tree () {
 git log --graph --pretty=format:'%d %an: %s %ar %h' | peco | awk -F ' ' '{ print $NF }'
}
zle -N peco-tree
bindkey "^U" peco-tree


##-----------------------------------------------------------
## cakephp
##-----------------------------------------------------------
export CAKE_ENV=localhost

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
