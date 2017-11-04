#!bin/bash

mkdir -p log

# update
sudo add-apt-repository ppa:jonathonf/vim -y >> ./log/update.log
sudo add-apt-repository ppa:numix/ppa -y >> ./log/update.log
sudo add-apt-repository ppa:webupd8team/java
sudo apt update -y >> ./log/update.log
sudo apt upgrade -y >> ./log/update.log

# install basic software
sudo apt-get install -y gcc g++ make vim curl wget zsh tmux fonts-font-awesome git >> ./log/install.log

# git
cp ./.gitconfig $HOME
cp ./.gitignore_global $HOME

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >> ./log/install.log
cp .zshrc $HOME
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git /tmp
/tmp/fonts/install.sh >> ./log/install.log
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono derivative Powerline 13'
sudo fc-cache -v -f

# vim
sudo apt-get install -y exuberant-ctags ack-grep vim-gtk >> ./log/install.log
git clone https://github.com/rapirent/vimrc.git
cp vimrc/_vimrc $HOME
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

# sdcv 
sudo apt-get install sdcv -y >> ./log/install.log
mkdir -p $HOME/.stardict/dic
tar jxvf stardict-langdao-ce-big5-2.4.2.tar.bz2 -C ~/.stardict/dic
tar jxvf stardict-langdao-ec-big5-2.4.2.tar.bz2 -C ~/.stardict/dic

# theme icon
sudo apt-get install numix-icon-theme-circle -y >> ./log/update.log

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/123.deb >> ./log/install.log
sudo dpkg -i /tmp/123.deb >> ./log/install.log
sudo rm -r -f /tmp/123.deb

# wallpaper 
cp ./wallpaper.jpg $HOME
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/dotfiles/wallpaper.jpg"

# autojump
git clone https://github.com/joelthelion/autojump /tmp
/tmp/autojump/make


# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y  >> ./log/update.log
sudo apt-get install code >> ./log/install.log
list = "HookyQR.beautify abusaidm.html-snippets bibhasdn.django-html bibhasdn.django-snippets dbaeumer.vscode-eslint
\ donjayamanne.githistory donjayamanne.python eamodio.gitlens ecmel.vscode-html-css esbenp.prettier-vscode
\ himanoa.Python-autopep8 michelemelluso.code-beautifier ms-vscode.sublime-keybindings
\ naumovs.color-highlight redhat.java robertohuertasm.vscode-icons vncz.vscode-apielements wholroyd.jinja
\ xabikos.JavaScriptSnippets zhuangtongfa.Material-theme"
for i in $list; do
    code --install-extensions "$i"
done
cp keybindings.json $HOME/.config/Code/User
cp settings.json $home/.config/Code/User


# S.M.A.R.T
sudo apt-get -y install smartmontools >> ./log/install.log

# java
sudo apt-get -y oracle-java8-installer >> ./log/install.log
