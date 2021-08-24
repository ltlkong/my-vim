call plug#begin()
	Plug 'preservim/nerdtree',{'on': 'NERDTreeToggle'}|
				\ Plug 'Xuyuanp/nerdtree-git-plugin'|
	Plug 'https://github.com/tpope/vim-fugitive.git'											
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'|
				\ Plug 'vim-airline/vim-airline-themes'
	Plug 'Yggdroot/indentLine'	
	Plug 'wfxr/minimap.vim', {'on': 'MinimapToggle'}
	Plug 'https://github.com/ap/vim-css-color.git'
call plug#end()
						
"Default key
let mapleader = " "
set encoding=UTF-8
				
"NerdTree
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=22

"coc
set nobackup
set nowritebackup
set updatetime=500
set shortmess+=c
set pumheight=10
"$ it needs to run sudo apt-get install ripgrep
let g:coc_global_extensions = ['coc-git','coc-grammarly', 'coc-marketplace', 
			\'coc-html','coc-diagnostic','coc-calc', 'coc-tsserver', 'coc-sql', 'coc-react-refactor','coc-markdownlint', 
			\'coc-phpls', 'coc-pyright', 'coc-css', 'coc-omnisharp']

"coc-key
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"fzf
nnoremap <C-f>r :Rg<CR>
nnoremap <C-f>f :Files<CR>
nnoremap <C-f>l :BLines<CR>

"airline"
let g:airline_theme="random"
let airline#extensions#tabline#enabled=1
let g:airlin_highlighting_cache=1

"indentline"
let g:indentLine_defaultGroup='SpecialKey'

"minimap"
let g:minimap_width=12
let g:minimap_git_colors=1
nnoremap <silent><Leader>m :MinimapToggle<CR>

"Tabs
nnoremap nt :tabnew<CR>

"Other
set hidden
set shiftwidth=4
set wrap
set nu
set wildmenu
syntax enable
set tabstop=4
let g:coc_disable_startup_warning=1
set	backspace=indent,eol,start
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
nnoremap <C-i> <C-i>
