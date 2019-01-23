#!bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor


# install basic software
brew install tmux wget tmux zsh

# git
cp .gitconfig $HOME
cp .gitignore_global $HOME


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc $HOME
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git /tmp/fonts
sudo /tmp/fonts/install.sh
sudo fc-cache -v -f
git clone https://github.com/zdharma/history-search-multi-word.git /tmp/history-search-multi-word
sudo cp -r /tmp/history-search-multi-word ~/.oh-my-zsh/custom/plugins/history-search-multi-word
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

cp .vimrc $HOME
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

brew install sdcv
mkdir -p $HOME/.stardict/dic
tar jxvf stardict-langdao-ce-big5-2.4.2.tar.bz2 -C ~/.stardict/dic
tar jxvf stardict-langdao-ec-big5-2.4.2.tar.bz2 -C ~/.stardict/dic


# vscode
# make sure if you have installed
list=("HookyQR.beautify" "abusaidm.html-snippets" "bibhasdn.django-html" "bibhasdn.django-snippets" "dbaeumer.vscode-eslint" \
"donjayamanne.githistory" "eamodio.gitlens" "ecmel.vscode-html-css" "esbenp.prettier-vscode" \
"himanoa.Python-autopep8" "michelemelluso.code-beautifier" "ms-vscode.sublime-keybindings" \
"naumovs.color-highlight" "redhat.java" "robertohuertasm.vscode-icons" "vncz.vscode-apielements" \
"wholroyd.jinja" "xabikos.JavaScriptSnippets" "zhuangtongfa.Material-theme")
for i in "${list[@]}"; do
    code --install-extension "$i"
done
sudo mkdir -p $HOME/Library/Application\ Support/Code/User/
cp keybindings.json  $HOME/Library/Application\ Support/Code/User/
cp settings.json $HOME/Library/Application\ Support/Code/User/

