sudo apt update

RED='\033[0;31m'
NC='\033[0m'

echo -e  ${RED}start installing vim${NC}
brew install vim
echo -e ${RED}finish${NC}

echo -e  ${RED}start installing ripgrep${NC}
brew install ripgrep
echo -e ${RED}finish${NC}

echo -e ${RED}start installing minimap${NC}
brew install code-minimap
echo -e ${RED}finish${NC}

echo -e ${RED}start installing node${NC}
brew install node
echo -e ${RED}finish${NC}

echo -e ${RED}start setting up vimrc${NC}
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat my.vim > ~/.vimrc
vim +silent +PlugInstall +CocInstall +qa
echo -e ${RED}finish${NC}

echo -e ${RED}start setting CocConfig${NC}
cp ./coc-settings.json ~/.vim/
echo -e ${RED}finish${NC}

echo -e ${RED}success${NC}

