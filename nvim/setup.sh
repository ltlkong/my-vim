RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
# Setup vimrc
echo -e ${BLUE}start setting up myvim${NC}
mkdir -p ~/.config/nvim/
cat ../plugins.vim > ~/.vimrc
nvim +silent +PlugInstall +qa
cat my.vim >> ~/.config/nvim/init.vim
# Setup coc
mkdir -p ~/.config/coc/
cp ../settings/coc-settings.json ~/.config/nvim/coc-settings.json
cp -r ../settings/ultisnips ~/.config/coc/
echo -e ${BLUE}finish${NC}
