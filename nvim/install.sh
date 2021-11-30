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

if [ $(uname) == 'Darwin' ]
then
#Mac

brew update

if ! command -v brew &> /dev/null
then
	echo -e  ${RED}start installing brew${NC}
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tielinli/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	echo -e ${RED}finish${NC}
fi

if ! command -v nvim &> /dev/null
then
	echo -e  ${RED}start installing vim${NC}
    pip3 install --upgrade pynvim
	brew install neovim
	echo -e ${RED}finish${NC}
fi

echo -e  ${RED}start installing ripgrep${NC}
brew install ripgrep
echo -e ${RED}finish${NC}

echo -e ${RED}start installing minimap${NC}
brew install code-minimap
echo -e ${RED}finish${NC}

echo -e ${RED}start installing node${NC}
brew install node
echo -e ${RED}finish${NC}

echo -e ${RED}start installing bat${NC}
brew install bat
echo -e ${RED}finish${NC}

echo -e ${RED}start installing curl${NC}
brew install curl
echo -e ${RED}finish${NC}

else
# Linux

sudo apt update

#install v14.17.5 node
echo -e ${BLUE}start installing node${NC}
apt remove -y nodejs
NODEAMD64='node-v14.17.5-linux-x64'
NODEAARCH64='node-v14.17.5-linux-arm64'
NODEARMV7='node-v14.17.5-linux-armv7l'

installNode() {
	local nodeBaseUrl='https://nodejs.org/dist/v14.17.5/'

	wget $nodeBaseUrl$1.tar.gz
	tar -xf ./$1.tar.gz
	cp -r ./$1/* /usr/local
	rm -r $1*
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
if ! command -v nvim &> /dev/null
then
	echo -e  ${BLUE}start installing vim${NC}
	apt install -y libncurses-dev make gcc python3 python python3-dev python-dev python3-pip
	apt remove -y vim
	rm /usr/local/bin/*vim*
	rm /usr/bin/*vim*
	apt install neovim
	source ~/.bashrc
	echo -e ${BLUE}finish${NC}
fi

#install ripgrep for fzf plugin
echo -e  ${BLUE}start installing ripgrep${NC}
apt install -y ripgrep
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
	cp ./$1/code-minimap /usr/local/bin
	rm -r $1**
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

#install others
echo -e ${BLUE}start installing bat curl${NC}
apt install bat -y
apt install curl -y
echo -e ${BLUE}finish${NC}

fi

#install vim-plug and set up vimrc
echo -e ${BLUE}start installing up vimrc${NC}
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e ${BLUE}finish${NC}

# Set up vimrc
source ./setup.sh

echo -e ${BLUE}success${NC}

