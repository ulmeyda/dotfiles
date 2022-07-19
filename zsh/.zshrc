### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-bin-gem-node
### End of Zinit's installer chunk

source $HOME/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions #サジェスト
zinit light zdharma-continuum/fast-syntax-highlighting  #ハイライト
zinit light zsh-users/zsh-history-substring-search
zinit light olets/zsh-abbr
zinit load zdharma-continuum/history-search-multi-word #search
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit ice wait"!0" atload"_zsh_autosuggest_start"
zinit light mafredri/zsh-async #非同期コマンド test用？
zinit ice wait'!0'; zinit light b4b4r07/enhancd #jump
zinit ice wait'!0'; zinit light mollifier/anyframe
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions


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
export ENHANCD_FILTER="fzf:non-existing-filter"

#-----------------------------------------------------------
# anyframe fzf
#-----------------------------------------------------------
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--reverse --inline-info'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color="fg:#d0d0d0,bg:#000000,hl:#40b2e0,gutter:#000000"
--color="fg+:#ffffff,bg+:#8909b3,hl+:#ffffff"
--color="info:#afaf87,prompt:#00b9d6,pointer:#ff5c5c"
--color="marker:#87ff00,spinner:#ff5c5c,header:#87afaf"'

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
    rg -l --hidden --glob "!.git/*" . | fzf | xargs sh -c 'nvim "$0" < /dev/tty'
    zle clear-screen
}
zle -N fzf-dir-open-app
bindkey '^F' fzf-dir-open-app

#-----------------------------------------------------------
# fzf grep access
#-----------------------------------------------------------
alias rgg="_rgAndNVim"
function _rgAndNVim() {
    if [ -z "$1" ]; then
        echo 'Usage: rgg PATTERN'
        return 0
    fi
    result=`rg -n --hidden $1 | fzf`
    line=`echo "$result" | awk -F ':' '{print $2}'`
    file=`echo "$result" | awk -F ':' '{print $1}'`
    if [ -n "$file" ]; then
        nvim $file +$line
    fi
}

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
## direnv
##-----------------------------------------------------------
eval "$(direnv hook zsh)"

##-----------------------------------------------------------
## golang
##-----------------------------------------------------------
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

function go_upgrade() {
  /usr/local/bin/go install golang.org/dl/go$1@latest
  go$1 download
  go$1 version
  ln -fns ~/go/bin/go$1 /usr/local/bin/go
}

##-----------------------------------------------------------
## git
##-----------------------------------------------------------
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

#-----------------------------------------------------------
# plantuml
#-----------------------------------------------------------
export PLANTUML_LIMIT_SIZE=81920 # 最大サイズを4kbから8kbへ

#-----------------------------------------------------------
# NVIM nightly PATH
#-----------------------------------------------------------
export PATH="$HOME/.config/nvim/nvim-osx64/bin:$PATH"

#-----------------------------------------------------------
# startship theme
#-----------------------------------------------------------
eval "$(starship init zsh)"

# local用
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
