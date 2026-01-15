#!/bin/bash
set -e
cd "$(dirname "$0")"

brew update
brew upgrade

brew bundle cleanup --file=Brewfile || true

brew cleanup
brew autoremove
brew doctor
