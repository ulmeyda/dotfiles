DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .gitignore .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: tool install

install:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

tool:
	$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)
	brew install neovim
	brew install fzf
	brew install ghq
	brew install starship

