#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet spatie/http-status-check

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install node

# Install global NPM packages
npm install --global cordova csslint eslint gulp imageoptim-cli ionic ios-deploy ios-sim jshint livereload yarn

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
