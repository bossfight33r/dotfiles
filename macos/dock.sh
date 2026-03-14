#!/usr/bin/env bash
echo "Configuring Dock..."

# Size and position
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true

# Clear current dock items
defaults write com.apple.dock persistent-apps -array

add_app() {
	defaults write com.apple.dock persistent-apps -array-add \
		"<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

add_app "/Applications/Telegram.app"
add_app "/Applications/kitty.app"
add_app "/Applications/Obsidian.app"
add_app "/Applications/Visual Studio Code.app"
add_app "/Applications/OrbStack.app"
add_app "/Applications/IINA.app"
add_app "/System/Applications/System Preferences.app"

killall Dock
echo "Done"
