.PHONY: install update stow-all

XDG_CONFIG := $(HOME)/.config

install:
	@echo "Installing dotfiles..."
	bash setup/install.sh
	$(MAKE) stow-all

update:
	bash setup/update.sh

stow-all:
	@mkdir -p $(XDG_CONFIG)
	@ln -sfn $(PWD)/nvim    $(XDG_CONFIG)/nvim
	@ln -sfn $(PWD)/kitty   $(XDG_CONFIG)/kitty
	@ln -sfn $(PWD)/bat     $(XDG_CONFIG)/bat
	@ln -sfn $(PWD)/glow    $(XDG_CONFIG)/glow
	@ln -sfn $(PWD)/lazydocker $(XDG_CONFIG)/lazydocker
	@ln -sfn $(PWD)/mise/config.toml $(XDG_CONFIG)/mise/config.toml
	@ln -sfn $(PWD)/zsh/starship.toml $(XDG_CONFIG)/starship.toml
	@ln -sf  $(PWD)/zsh/.zshrc $(XDG_CONFIG)/zsh/.zshrc
	@ln -sf  $(PWD)/git/.gitconfig $(HOME)/.gitconfig
	@ln -sf  $(PWD)/git/.gitignore_global $(HOME)/.gitignore_global
	@echo "Done"
