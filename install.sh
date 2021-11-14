#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'

echo -e ${RED}Warning this script will install vim, vim -plug, node, python, ripgrep, code-minimap and gcc, do you still want to continue?'(Y/n)'${NC} 

read shouldContinue

if [ $shouldContinue != 'y' ]
then 
	exit
fi

sudo apt update

#install v14.17.5 node
echo -e ${BLUE}start installing node${NC}
sudo apt remove -y nodejs
NODEAMD64='node-v14.17.5-linux-x64'
NODEAARCH64='node-v14.17.5-linux-arm64'
NODEARMV7='node-v14.17.5-linux-armv7l'

installNode() {
	local nodeBaseUrl='https://nodejs.org/dist/v14.17.5/'

	wget $nodeBaseUrl$1.tar.gz
	tar -xf ./$1.tar.gz
	sudo cp -r ./$1/* /usr/local
	sudo rm -r $1*
	node -v
}

case $(uname -m) in
	'aarch64') installNode $NODEAARCH64
		;;
	'armv7l') installNode $NODEARMV7
		;;
	*) installNode $NODEAMD64
		;;
esac
echo -e ${BLUE}finish${NC}

#install and compile the newest vim
if ! command -v vim &> /dev/null
then
	echo -e  ${BLUE}start installing vim${NC}
	sudo apt install -y libncurses-dev make gcc python3 python python3-dev python-dev
	sudo apt remove -y vim
	sudo rm /usr/local/bin/*vim*
	sudo rm /usr/bin/*vim*
	git clone https://github.com/vim/vim.git && cd vim
	echo -e  ${YELLOW}configuring the vim feature${NC}
	./configure --enable-pythoninterp=yes --enable-python3interp=yes --prefix=/usr/local/
	echo -e ${YELLOW}finish${NC}
	make && sudo make install
	cd ..
	rm -rf vim
	source ~/.bashrc
	echo -e ${BLUE}finish${NC}
fi

#install ripgrep for fzf plugin
echo -e  ${BLUE}start installing ripgrep${NC}
sudo apt install -y ripgrep
echo -e ${BLUE}finish${NC}

#install minimap for minimap plugin
echo -e ${BLUE}start installing minimap${NC}
MINIMAPAMD64='code-minimap-v0.6.1-i686-unknown-linux-musl'
MINIMAPAARCH64='code-minimap-v0.6.1-aarch64-unknown-linux-gnu'
MINIMAPARMV7='code-minimap-v0.6.1-arm-unknown-linux-gnueabihf'

installMiniMap() {
	local minimapBaseUrl='https://github.com/wfxr/code-minimap/releases/download/v0.6.1/'

	wget $minimapBaseUrl$1.tar.gz
	tar -xf $1.tar.gz
	sudo cp ./$1/code-minimap /usr/local/bin
	sudo rm -r $1**
}

case $(uname -m) in
	'aarch64') installMiniMap $MINIMAPAARCH64
		;;
	'armv7l') installMiniMap $MINIMAPARMV7
		;;
	*) installMiniMap $MINIMAPAMD64
		;;
esac
echo -e ${BLUE}finish${NC}

#install vim-plug and set up vimrc
echo -e ${BLUE}start installing up vimrc${NC}
sudo apt install curl -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e ${BLUE}finish${NC}

source ./setup.sh

echo -e ${BLUE}success${NC}

