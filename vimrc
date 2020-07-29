call plug#begin()
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
call plug#end()

set nocompatible
filetype plugin on
syntax on

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

let mapleader = "\<Space>"

set number
set relativenumber
set history=1000
set hidden
set undofile
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set incsearch
set hlsearch
set smartcase

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap <Space> <Nop>
nmap <silent> ,/ :nohlsearch<cr>
nmap <c-p> :FZF<cr>
nmap <c-b> :Buffers<cr>
nmap <tab> :tabnext<cr>
nmap <S-tab> :tabprevious<cr>
map j gj
map k gk

autocmd BufWritePre * %s/\s\+$//e

highlight clear SignColumn

let g:airline_theme='base16_monokai'
let g:airline#extensions#ale#enabled = 1
