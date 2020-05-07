/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#!bin/bash
#pyenv
brew update
brew install pyenv

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
