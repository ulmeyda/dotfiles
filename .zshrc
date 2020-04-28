# Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zplugin light "zsh-users/zsh-completions" #コマンド補完
zplugin ice wait"!0" atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "mafredri/zsh-async" #非同期コマンド test用？
#zplugin light "sindresorhus/pure"
zplugin ice wait'!0'; zplugin light zsh-users/zsh-history-substring-search #history search
zplugin ice wait'!0'; zplugin light "mollifier/anyframe" #peco
zplugin ice wait'!0'; zplugin light "b4b4r07/enhancd" #jump
zplugin ice wait"!0" atinit"zpcompinit; zpcdreplay"
zplugin light zsh-users/zsh-syntax-highlighting #highlight

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
HISTSIZE=40000
SAVEHIST=40000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#-----------------------------------------------------------
# enhancd jump移動
#-----------------------------------------------------------
export ENHANCD_FILTER="/usr/local/bin/peco:fzf:non-existing-filter"

#-----------------------------------------------------------
# anyframe fzf
#-----------------------------------------------------------
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--reverse --inline-info"

zstyle ":anyframe:selector:" use fzf

bindkey '^B' anyframe-widget-checkout-git-branch
bindkey '^G' anyframe-widget-insert-git-branch
bindkey '^R' anyframe-widget-execute-history

#-----------------------------------------------------------
# history-substring-seach
#-----------------------------------------------------------
autoload history-search-end
bindkey "^P" history-substring-search-down
bindkey "^N" history-substring-search-up

#-----------------------------------------------------------
# fzf file access
#-----------------------------------------------------------
function fzf-dir-open-app () {
    rg -l . | fzf | xargs sh -c 'nvim "$0" < /dev/tty'
    zle clear-screen
}
zle -N fzf-dir-open-app
bindkey '^F' fzf-dir-open-app

#-----------------------------------------------------------
# fzf ghq
#-----------------------------------------------------------
function fzf-src () {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-src
bindkey '^]' fzf-src


##-----------------------------------------------------------
## shell integration
## https://www.iterm2.com/documentation-shell-integration.html
##-----------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#-----------------------------------------------------------
# anyenv
#-----------------------------------------------------------
export ANYENV_ROOT="$HOME/.anyenv"
export PYENV_ROOT="$ANYENV_ROOT/envs/pyenv"

if [ -d $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi

function anyenv_init() {
  eval "$(anyenv init - --no-rehash)"
}
function anyenv_unset() {
  unset -f goenv
}
function goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}

eval "$(direnv hook zsh)"

##-----------------------------------------------------------
## golang
##-----------------------------------------------------------
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN


#-----------------------------------------------------------
# ls
#-----------------------------------------------------------
alias ls='ls -G'
alias la='ls -al'
alias ll='ls -lh'

#-----------------------------------------------------------
# cd
#-----------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#-----------------------------------------------------------
# global alias
#-----------------------------------------------------------
alias -g A='| awk'
alias -g C='| pbcopy' # copy
alias -g C='| wc -l' # count
alias -g G='| grep --color=auto' # 鉄板
alias -g H='| head' # 当然tailもね
alias -g L='| less -R'
alias -g X='| xargs'

#-----------------------------------------------------------
# rg
#-----------------------------------------------------------
alias rg='rg --hidden'

#-----------------------------------------------------------
# dotfiles
#-----------------------------------------------------------
alias zshrc='vim ~/.zshrc'
alias nviminit='nvim ~/.config/nvim/init.vim'


#-----------------------------------------------------------
# git
#-----------------------------------------------------------
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push origin'
alias gph='git push origin HEAD'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gca='git checkout --amend'
alias gcm='git checkout origin/master'
alias gf='git fetch'
alias gc='git commit -v'
alias gt="git log --graph --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"
alias gl="git log --decorate"
alias glo="git log --decorate --stat --patch"
alias gls="git ls-files"

#-----------------------------------------------------------
# docker
#-----------------------------------------------------------
alias di='docker images'
alias dr='docker rm'
alias dri='docker rmi'
alias dps='docker ps -a'
alias dco='docker-compose'

#-----------------------------------------------------------
# plantuml
#-----------------------------------------------------------
export PLANTUML_LIMIT_SIZE=81920 # 最大サイズを4kbから8kbへ


# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# NVIM nightly PATH
export PATH="$HOME/.config/nvim/nvim-osx64/bin:$PATH"

# startship theme
eval "$(starship init zsh)"

