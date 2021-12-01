call plug#begin()
	Plug 'preservim/nerdtree',{'on': 'NERDTreeToggle'}|
				\ Plug 'Xuyuanp/nerdtree-git-plugin'|
				\ Plug 'PhilRunninger/nerdtree-visual-selection'
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}|
				\ Plug 'antoinemadec/coc-fzf'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }|
				\ Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'|
				\ Plug 'vim-airline/vim-airline-themes'
	Plug 'wfxr/minimap.vim', {'on': 'MinimapToggle'}
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'jiangmiao/auto-pairs'
	Plug 'morhetz/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
                \ Plug 'romgrk/nvim-treesitter-context' |
                \ Plug 'p00f/nvim-ts-rainbow'
call plug#end()

