#!/bin/bash
set -e
cd "$(dirname "$0")"

if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --file=Brewfile

if [ ! -d ~/.zsh/fzf-tab ]; then
  git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
fi

if ! grep -q ZDOTDIR ~/.zshenv 2>/dev/null; then
  cat > ~/.zshenv <<'EOF'
export ZDOTDIR="$HOME/.config/zsh"
export PATH="$HOME/.local/bin:$PATH"
EOF
fi
