#!bin/bash

#homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew install newsboat # RSS feed
brew install curl
#pyenv
brew install pyenv
#configure source zip
brew install zlib bzip2 libiconv

#php https://github.com/phpbrew/phpbrew
# may need the GNU readline: brew install readline
curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
chmod +x phpbrew.phar
sudo mv phpbrew.phar /usr/local/bin/phpbrew


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc $HOME
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git
sudo ~/install.sh
# now you should configure the fonts and theme in your terminal program
git clone https://github.com/zdharma/history-search-multi-word.git /tmp/history-search-multi-word
sudo cp -r /tmp/history-search-multi-word $ZSH/custom/plugins/history-search-multi-word
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# vim
# brew install vim
# vim is pre-installed in macOS
cp .vimrc $HOME
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

cp keybindings.json $HOME/Library/Application\ Support/Code/User/
cp settings.json $HOME/Library/Application\ Support/Code/User/
