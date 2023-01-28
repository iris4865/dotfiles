#!/bin/bash

set -e

function exists() {
  command -v "$1" >/dev/null
}

echo -n "Installing Homebrew... "
if exists brew; then
  echo "installed"
else
  echo "not installed"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install cask
  brew install mas
fi

echo "Updating Homebrew..."
brew update

echo "Installing Homebrew packages..."
brew bundle --file=../Brewfile