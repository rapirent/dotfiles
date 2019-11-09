#!bin/bash

# update
sudo add-apt-repository ppa:jonathonf/vim -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt update -y

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
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

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

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt-get install code
list=("HookyQR.beautify" "abusaidm.html-snippets" "bibhasdn.django-html" "bibhasdn.django-snippets" "dbaeumer.vscode-eslint" \
"donjayamanne.githistory" "eamodio.gitlens" "ecmel.vscode-html-css" "esbenp.prettier-vscode" \
"himanoa.Python-autopep8" "michelemelluso.code-beautifier" "ms-vscode.sublime-keybindings" \
"naumovs.color-highlight" "redhat.java" "robertohuertasm.vscode-icons" "vncz.vscode-apielements" \
"wholroyd.jinja" "xabikos.JavaScriptSnippets" "zhuangtongfa.Material-theme")
for i in "${list[@]}"; do
    code --install-extension "$i"
done
# you need to setup the python path for pylint
sudo mkdir -p ~/.config/Code/User
cp keybindings.json ~/.config/Code/User
cp settings.json ~/.config/Code/User
# code-server
wget https://github.com/cdr/code-server/releases/download/2.1688-vsc1.39.2/code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz
tar --extract --file code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz
cp settings.json ~/.local/share/code-server/User/
cp keybindings.json ~/.local/share/code-server/User/


# S.M.A.R.T
sudo apt-get -y install smartmontools

sudo apt -y autoremove

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -P ~/.bash/

# pyenv require
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# chinese-input
sudo apt-get install fcitx fcitx-chewing
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# ref: https://unix.stackexchange.com/questions/281858/difference-between-xinitrc-xsession-and-xsessionrc
cp .xsession ~/
cp .pampam_environment ~/
SYSCONFDIR=/etc
cp fcitx-autostart.desktop ${SYSCONFDIR}/xdg/autostart/
sudo apt remove ibus

# open forticlient
sudo apt-get install gcc automake autoconf libssl-dev make pkg-config
git clone https://github.com/adrienverge/openfortivpn.git ~/openfortivpn
cd ~/openfortivpn
./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
sudo make install

# openssh
sudo apt-get install openssh-server
sudo cp sshd_config /etc/ssh/
sudo /etc/init.d/ssh start
sudo apt-get install autoconf

# ssd setting
# ref: https://www.itread01.com/content/1550606791.html
# sudo vim /etc/fstab
#tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0
#tmpfs /var/tmp tmpfs defaults,noatime,mode=1777 0 0
#tmpfs /var/log tmpfs defaults,noatime,mode=1777 0 0

cd ~/.cache/google-chrome/Default
rm -rf Cache
ln -s /tmp Cache
rm -rf Media\ Cache
ln -s /tmp Media\ Cache

cd ~
rm -rf .cache
ln -s /tmp .cache

# autofs
sudo apt-get install nfs-common autofs
# need to edit the /etc/auto.master /etc/auto.nfs
sudo /etc/init.d/autofs restart

