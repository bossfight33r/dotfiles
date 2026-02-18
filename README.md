# dotfiles

My personal dotfiles for macOS. Managed manually, no framework.

## what's inside

| tool | config |
|------|--------|
| [kitty](https://sw.kovidgoyal.net/kitty/) | terminal emulator, kanagawa theme |
| [neovim](https://neovim.io/) | lazy.nvim, LSP (pyright/gopls/ts_ls), telescope |
| [zsh](https://www.zsh.org/) | autosuggestions, syntax highlighting, fzf-tab |
| [starship](https://starship.rs/) | minimal prompt |
| [bat](https://github.com/sharkdp/bat) | cat replacement, zenburn theme |
| [lazygit](https://github.com/jesseduffield/lazygit) | git TUI |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | docker TUI |
| [mise](https://mise.jdx.dev/) | runtime version manager (node, python, go) |

## install

```sh
git clone https://github.com/bossfight33r/dotfiles ~/.config/dotfiles
cd ~/.config/dotfiles
make install
```

## structure

```
dotfiles/
├── nvim/          # neovim config (lazy.nvim)
├── zsh/           # .zshrc + starship.toml
├── kitty/         # kitty.conf + kanagawa theme
├── git/           # .gitconfig + .gitignore_global
├── bat/           # bat config
├── glow/          # glow config
├── lazydocker/    # lazydocker config
├── mise/          # mise.toml
└── setup/         # Brewfile + install.sh
```
