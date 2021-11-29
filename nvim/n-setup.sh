RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
# Setup vimrc
echo -e ${BLUE}start setting up myvim${NC}
mkdir -p ~/.config/nvim/
cat my.vim > ~/.config/nvim/init.vim
nvim +silent +PlugInstall +qa
# Setup coc
mkdir -p ~/.config/coc/
cp ../settings/coc-settings.json ~/.vim/
cp -r ../settings/ultisnips ~/.config/coc/
echo "colorscheme gruvbox" >> ~/.config/nvim/init.vim
echo -e ${BLUE}finish${NC}
