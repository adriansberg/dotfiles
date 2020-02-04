"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Syntax highlighting.
syntax enable

" Use iMproved Vi.
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround' 
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'jreybert/vimagit'
" Plug 'LukeSmithxyz/vimling'
" Plug 'vimwiki/vimwiki'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-fugitive'
" Plug 'mattn/gist-vim'
" Plug 'gabesoft/vim-ags'
" Plug 'ctrlp.vim'
" Plug 'matchit.zip'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

call plug#end()

filetype plugin indent on

" Colors & Scheme.
set background=dark
"colorscheme solarized

" Leader configuration.
let mapleader = ","
let g:mapleader = ","

" Airline configuration.
set laststatus=2
set t_Co=256
let g:airline_theme='minimalist'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ' ¶'

" Set mouse enabled
set mouse=a

" Enhance command-line completion.
set wildmenu

" Allow cursor keys in insert mode.
set esckeys

" Allow backspace in insert mode.
" set backspace=indent,eol,start

" Optimize for fast terminal connections.
set ttyfast

" Add the g flag to search/replace by default.
set gdefault

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files.
set binary
set noeol

" Centralize backups, swapfiles and undo history.
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" if exists("&undodir")
" 	set undodir=~/.vim/undo
" endif

" Don’t create backups when editing files in certain directories.
" set backupskip=/tmp/*,/private/tmp/*

" Enable line numbers.
set number
set relativenumber
set scrolloff=3

" Enable syntax highlighting.
syntax on

" Highlight current line.
" set cursorline

" Highlight searches.
set hlsearch

" Ignore case of searches.
set ignorecase

" Highlight dynamically as pattern is typed.
set incsearch

" Enable mouse in all modes.
" set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position.
set ruler

" Show the filename in the window titlebar.
set title

" Defines the clipboard name.
set clipboard=unnamed

" Tabs configuration.
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" Gist configuration.
" let g:gist_clip_command = 'pbcopy'
" let g:gist_detect_filetype = 1
" let g:gist_open_browser_after_post = 1

" Easymotion configuration.
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Rainbow Parentheses.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Force quit alias.
nmap fq :q!<CR>

" Ctrlp.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Use urlscan to choose and open a url:
:noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
:noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P
set clipboard=unnamed

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %


" Syntastic configuration.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nmap <leader>st :SyntasticToggleMode<cr>
nmap <leader>n :NERDTreeToggle<CR>

" Splits.
set splitbelow
set splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Trailing Whitespaces.
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
match ErrorMsg '\s\+$'
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
" If the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

