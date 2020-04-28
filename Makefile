DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .gitignore .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: starship zinit install

install:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

zinit:
	$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)

starship:
	brew install starship

