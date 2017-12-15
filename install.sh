#!bin/bash

# update
sudo add-apt-repository ppa:jonathonf/vim -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt update -y
sudo apt upgrade -y

# install basic software
sudo apt-get install -y gcc g++ make vim curl wget zsh tmux fonts-font-awesome git tig git-flow gpaint

# git
cp .gitconfig $HOME
cp .gitignore_global $HOME

# python
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
sudo apt install virtualenv -y

# autojump
sudo apt-get install autojump -y

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc $HOME
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git /tmp/fonts
sudo /tmp/fonts/install.sh
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono derivative Powerline 13'
sudo fc-cache -v -f
git clone https://github.com/zdharma/history-search-multi-word.git /tmp/history-search-multi-word
sudo cp -r /tmp/history-search-multi-word $ZSH/custom/plugins/history-search-multi-word

# vim
sudo apt-get install -y exuberant-ctags vim-gtk vim-gnome
cp .vimrc $HOME
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

# sdcv
sudo apt-get install sdcv -y
mkdir -p $HOME/.stardict/dic
tar jxvf stardict-langdao-ce-big5-2.4.2.tar.bz2 -C ~/.stardict/dic
tar jxvf stardict-langdao-ec-big5-2.4.2.tar.bz2 -C ~/.stardict/dic

# theme icon
sudo apt-get install numix-icon-theme-circle -y

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/123.deb
sudo dpkg -i /tmp/123.deb
sudo rm -r -f /tmp/123.deb
sudo apt --fix-broken install -y

# wallpaper
sudo cp ./wallpaper.jpg $HOME
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/dotfiles/wallpaper.jpg"

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt-get install code
list=("HookyQR.beautify" "abusaidm.html-snippets" "bibhasdn.django-html" "bibhasdn.django-snippets" "dbaeumer.vscode-eslint" \
"donjayamanne.githistory" "donjayamanne.python" "eamodio.gitlens" "ecmel.vscode-html-css" "esbenp.prettier-vscode" \
"himanoa.Python-autopep8" "michelemelluso.code-beautifier" "ms-vscode.sublime-keybindings" \
"naumovs.color-highlight" "redhat.java" "robertohuertasm.vscode-icons" "vncz.vscode-apielements" \
"wholroyd.jinja" "xabikos.JavaScriptSnippets" "zhuangtongfa.Material-theme")
for i in "${list[@]}"; do
    code --install-extension "$i"
done
sudo mkdir -p ~/.config/Code/User
cp keybindings.json ~/.config/Code/User
cp settings.json ~/.config/Code/User


# S.M.A.R.T
sudo apt-get -y install smartmontools

# java
sudo apt-get -y install oracle-java8-installer

sudo apt -y autoremove
