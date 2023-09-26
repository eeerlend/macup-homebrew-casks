#!/bin/bash

function install_or_upgrade_cask {
  if brew ls --cask --versions ${1} > /dev/null; then
		report_from_package "${1} already installed."
	else
		report_from_package " Installing cask ${1}"
		brew install --cask ${1} --appdir=/Applications
	fi
}

# Install Homebrew casks
# todo: check if array is declared up front!
# shellcheck disable=SC2154
for ((i=0; i<${#macup_homebrew_casks[@]}; ++i)); do
	install_or_upgrade_cask "${macup_homebrew_casks[i]}"
done

# Update outdated casks
brew cask upgrade
