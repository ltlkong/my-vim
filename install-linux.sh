sudo apt update

RED='\033[0;31m'
NC='\033[0m'

echo -e ${RED}start installing node${NC}
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
echo -e ${RED}finish${NC}

echo -e  ${RED}start installing vim${NC}
sudo apt install -y libncurses-dev make gcc
sudo apt remove -y vim
git clone https://github.com/vim/vim.git
cd ./vim/src
pwd
sudo apt install -y make gcc
make distclean  # if you build Vim before
make
sudo make install
cd ../..
rm -rf vim
source ~/.bashrc
echo -e ${RED}finish${NC}

echo -e  ${RED}start installing ripgrep${NC}
sudo apt install -y ripgrep
echo -e ${RED}finish${NC}

echo -e ${RED}start installing minimap${NC}
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
echo -e ${RED}finish${NC}

echo -e ${RED}start setting up vimrc${NC}
sudo cat my.vim > ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e ${RED}finish${NC}

echo -e ${RED}start setting CocConfig${NC}
sudo cp ./coc-settings.json ~/.vim/
echo -e ${RED}finish${NC}

echo -e ${RED}success${NC}

