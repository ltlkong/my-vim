call plug#begin()
	Plug 'preservim/nerdtree',  { 'on':  'NERDTreeToggle' } |
				\ Plug 'Xuyuanp/nerdtree-git-plugin' |
				\ Plug 'PhilRunninger/nerdtree-visual-selection'
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} |
				\ Plug 'antoinemadec/coc-fzf'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
				\ Plug 'junegunn/fzf.vim'
	Plug 'wfxr/minimap.vim', {'on': 'MinimapToggle'}
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'morhetz/gruvbox'
    Plug 'mfussenegger/nvim-dap'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
                \ Plug 'windwp/nvim-ts-autotag' |
                \ Plug 'theHamsta/nvim-dap-virtual-text' 
    Plug 'nvim-lualine/lualine.nvim' 
    Plug 'phaazon/hop.nvim' 
    Plug 'dstein64/vim-startuptime'
call plug#end()
