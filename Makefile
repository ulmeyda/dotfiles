all: tool gotool install

install:
	stow -v git zsh dircolors karabiner kitty nvim tig

tool:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 	/bin/bash -c "$$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

gotool:
	go install golang.org/x/tools/cmd/goimports@latest
	go install github.com/rakyll/gotest@latest
	go install github.com/cweill/gotests/...@latest
