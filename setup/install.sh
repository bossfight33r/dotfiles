#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

if ! command -v brew >/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==> Installing brew packages..."
brew bundle --file=Brewfile

echo "==> Installing casks..."
brew bundle --file=Caskfile

echo "==> Installing npm globals..."
while IFS= read -r pkg; do
	[[ -z "$pkg" || "$pkg" == \#* ]] && continue
	npm install -g "$pkg"
done < npmfile

echo "==> Installing mas apps..."
while IFS= read -r line; do
	[[ -z "$line" || "$line" == \#* ]] && continue
	id="${line%% *}"
	mas install "$id"
done < Masfile

if [ ! -d ~/.zsh/fzf-tab ]; then
	git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
fi

if ! grep -q ZDOTDIR ~/.zshenv 2>/dev/null; then
	cat > ~/.zshenv <<'EOF'
export ZDOTDIR="$HOME/.config/zsh"
export PATH="$HOME/.local/bin:$PATH"
EOF
fi

mkdir -p ~/Pictures/Screenshots
