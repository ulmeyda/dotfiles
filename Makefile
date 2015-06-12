DOTFILES_EXCLUDES := .DS_Store .git .zsh .gitmodules .gitignore .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: remove update install

install:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

remove:
	rm -rf $(HOME)/.zsh $(HOME)/.vim
