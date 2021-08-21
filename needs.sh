sudo apt update

RED='\033[0;31m'
NC='\033[0m'


echo -e  ${RED}start installing ripgrep${NC}
sudo apt install -y ripgrep
echo -e ${RED}finish installing ripgrep${NC}

echo -e ${RED}start installing minimap${NC}
MINIMAPLINKAMD64='code-minimap-v0.6.1-i686-unknown-linux-musl'
MINIMAPLINKAARCH64='code-minimap-v0.6.1-aarch64-unknown-linux-gnu'

installMiniMap() {
	local minimapBaseUrl='https://github.com/wfxr/code-minimap/releases/download/v0.6.1/'

	wget $minimapBaseUrl$1'.tar.gz'
	tar -xf $1'.tar.gz'
	sudo cp $1'/code-minimap' '/usr/local/bin'
	sudo rm -r code-minimap*
}

case $(uname -m) in
	'aarch64') installMiniMap $MINIMAPLINKAARCH64
		;;
	*) installMiniMap $MINIMAPLINKAMD64
		;;
esac

echo -e ${RED}finish installing minimp${NC}

echo -e ${RED}start setting up vimrc${NC}
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat my.vim > ~/.vimrc
vim +silent +PlugInstall +CocInstall +qa
echo -e ${RED}finish setting up vimrc${NC}

echo -e ${RED}start setting coc-setting${NC}
sudo cp ./coc-settings.json ~/.vim/
echo -e ${RED}end setting coc-setting${NC}

echo -e ${RED}success${NC}

