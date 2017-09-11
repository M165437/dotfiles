# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure PHP 7.1 is loaded
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Sencha Cmd
export PATH="/opt/Sencha/Cmd:$PATH"

# Android SDK
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"