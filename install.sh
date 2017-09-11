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
zsh_path=$(which zsh)
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet spatie/http-status-check

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install Zsh NVM plugin
git clone https://github.com/lukechilds/zsh-nvm $HOME/.oh-my-zsh/plugins/zsh-nvm
source $HOME/.oh-my-zsh/plugins/zsh-nvm/zsh-nvm.plugin.zsh
nvm install node
npm install -g npm

# Install global npm packages with yarn
yarn global add cordova csslint eslint gulp imageoptim-cli ionic ios-deploy ios-sim jshint livereload

# Install ruby gem cocoapods
gem install cocoapods
pod setup

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
