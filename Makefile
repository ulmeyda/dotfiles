DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .gitignore .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

UNAME := $(shell uname)

all: remove update neovim vim-plugin peco zsh install

install:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
ifeq ($(UNAME), Darwin)
	ln -snfv ${HOME}/dotfiles/.vim ${HOME}/.config/nvim
	ln -snfv ${HOME}/dotfiles/.vimrc ${HOME}/.config/nvim/init.vim
endif 

update:
	git pull origin master

remove:
	rm -rf $(HOME)/.zsh $(HOME)/.vim

peco:
ifeq ($(UNAME), Linux)
	wget https://github.com/peco/peco/releases/download/v0.3.5/peco_linux_amd64.tar.gz -O /tmp/peco_linux_amd64.tar.gz
	tar xvzf /tmp/peco_linux_amd64.tar.gz
	sudo mv ./peco_linux_amd64/peco /usr/local/bin/peco
	rm -rf ./peco_linux_amd64
endif 
ifeq ($(UNAME), Darwin)
	brew install peco
endif 

zsh:
	git clone git@github.com:zsh-users/antigen.git ~/dotfiles/.zsh/antigen

git:
	gem install git-issue

neovim:
ifeq ($(UNAME), Darwin)
	brew install neovim/neovim/neovim
endif 

vim-plugin:
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/dotfiles/.vim/dein
	rm -f ./installer.sh
	env PY3=ON
	~/.vim/bundle/repos/github.com/nixprime/cpsm/install.sh
