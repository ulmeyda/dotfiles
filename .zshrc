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
export EDITOR=nvim

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

export CLICOLOR=1

#-----------------------------------------------------------
# HISTROY
#-----------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#-----------------------------------------------------------
# docker
#-----------------------------------------------------------
alias di='docker images'
alias dr='docker rm'
alias dri='docker rmi'
alias dps='docker ps -a'
alias dco='docker-compose'

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
#bindkey '^F' anyframe-widget-insert-filename

#-----------------------------------------------------------
# history-substring-seach
#-----------------------------------------------------------
autoload history-search-end
bindkey "^P" history-substring-search-down
bindkey "^N" history-substring-search-up

#-----------------------------------------------------------
# peco git-issue
#-----------------------------------------------------------
function peco-dir-open-app () {
    rg -l . | peco | xargs sh -c 'nvim "$0" < /dev/tty'
    zle clear-screen
}
zle -N peco-dir-open-app
bindkey '^F' peco-dir-open-app     # C-x t

#-----------------------------------------------------------
# peco git-tree
#-----------------------------------------------------------
function peco-tree () {
 git log --graph --pretty=format:'%d %an: %s %ar %h' | peco | awk -F ' ' '{ print $NF }'
}
zle -N peco-tree
bindkey "^U" peco-tree

#-----------------------------------------------------------
# peco jira-issue
#-----------------------------------------------------------
function peco-jira-issue () {
  node ~/jira/jira.js | peco | awk '{ print $1 }' | anyframe-action-insert
}
zle -N peco-jira-issue
bindkey "^T" peco-jira-issue

#-----------------------------------------------------------
# peco ghq
#-----------------------------------------------------------
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

#-----------------------------------------------------------
# shell integration
# https://www.iterm2.com/documentation-shell-integration.html
#-----------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#-----------------------------------------------------------
# golang
#-----------------------------------------------------------
export GOPATH=$HOME/code
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

#-----------------------------------------------------------
# git
#-----------------------------------------------------------
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

#-----------------------------------------------------------
# anyenv
#-----------------------------------------------------------
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
eval "$(direnv hook zsh)"
