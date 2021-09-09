RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
# Setup vimrc
echo -e ${BLUE}start setting up myvim${NC}
sudo cat my.vim > ~/.vimrc
vim +PlugInstall +qa
# Setup coc
sudo mkdir -p ~/.config/coc/
sudo cp ./coc-settings.json ~/.vim/
sudo cp -r ./ultisnips ~/.config/coc/
echo -e ${BLUE}finish${NC}
