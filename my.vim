call plug#begin()
	Plug 'preservim/nerdtree',{'on': 'NERDTreeToggle'}|
				\ Plug 'Xuyuanp/nerdtree-git-plugin'|
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}|
				\ Plug 'antoinemadec/coc-fzf'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }|
				\ Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'|
				\ Plug 'vim-airline/vim-airline-themes'
	Plug 'wfxr/minimap.vim', {'on': 'MinimapToggle'}
	Plug 'tpope/vim-surround'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'easymotion/vim-easymotion'
	Plug 'jiangmiao/auto-pairs'
call plug#end()
						
"Default
let mapleader = ","
au BufNewFile,BufRead *.cshtml set filetype=html
set encoding=UTF-8
set hidden
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab
set smartindent
set wrap
set lazyredraw
set wildmenu
set splitbelow splitright
set	backspace=indent,eol,start
set incsearch
set smartcase
set signcolumn=auto
set cursorline
nnoremap <C-i> <C-i>

"Theme
let g:PaperColor_Theme_Options = {
	\   'theme': {
	\     'default': {
	\       'transparent_background': 1
  	\     }
  	\   }
  	\ }
set t_Co=256
set background=dark

"if strftime("%H") < 10
"	set background=light
"else
"	set background=dark
"endif

"NerdTree
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=22

"coc
set nobackup
set nowritebackup
set updatetime=500
set shortmess+=c
set pumheight=10
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_disable_startup_warning=1
let g:coc_global_extensions = [
	\'coc-git',
	\'coc-grammarly', 
	\'coc-marketplace', 
	\'coc-html',
	\'coc-diagnostic',
	\'coc-calc', 
	\'coc-tsserver', 
	\'coc-sql', 
	\'coc-phpls', 
	\'coc-pyright',
	\'coc-css', 
	\'coc-omnisharp', 
	\'coc-snippets', 
	\'coc-htmlhint',
	\'coc-docker',
	\'coc-webpack',
	\'coc-prettier',
	\'coc-tabnine'
	\]
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"coc-key
nnoremap <silent><nowait> <space>o  :<C-u>CocFzfList outline<cr>
nnoremap <silent><nowait> <space>cc  :<C-u>CocFzfList commands<cr>
nnoremap <silent><nowait> <space>d  :<C-u>CocFzfList diagnostics<cr>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"fzf
nnoremap <space>r :Rg<CR>
nnoremap <space>f :Files<CR>
nnoremap <space>l :BLines<CR>
nnoremap <space>gs :GFiles?<CR>
nnoremap <space>g :GFiles<CR>
nnoremap <space>m :Maps<CR>
nnoremap <space>c :Commands<CR>

"airline"
let g:airline_theme="papercolor"
let airline#extensions#tabline#enabled=1
let g:airlin_highlighting_cache=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 1

"indentline"
let g:indentLine_defaultGroup='SpecialKey'

"minimap"
let g:minimap_width=12
let g:minimap_git_colors=1
nnoremap <silent><C-y> :MinimapToggle<CR>

"Tabs
nnoremap tt :tabnew<CR>

"Terminal
set tws=10*0

"Line number
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"easymotion
let g:EasyMotion_do_mapping = 0
nmap  <Leader>w <Plug>(easymotion-bd-w)
