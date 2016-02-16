DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .gitignore .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: remove update peco zsh install

mac: remove update peco-mac zsh install

install:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

remove:
	rm -rf $(HOME)/.zsh $(HOME)/.vim

peco:
	wget https://github.com/peco/peco/releases/download/v0.3.5/peco_linux_amd64.tar.gz -O /tmp/peco_linux_amd64.tar.gz
	tar xvzf /tmp/peco_linux_amd64.tar.gz
	sudo mv ./peco_linux_amd64/peco /usr/local/bin/peco
	rm -rf ./peco_linux_amd64

peco-mac:
	wget https://github.com/peco/peco/releases/download/v0.3.5/peco_darwin_amd64.zip
	tar xvzf /tmp/peco_linux_amd64.tar.gz
	sudo mv ./peco_linux_amd64/peco /usr/local/bin/peco
	rm -rf ./peco_linux_amd64

zsh:
	git clone git@github.com:zsh-users/antigen.git ~/dotfiles/.zsh/antigen
