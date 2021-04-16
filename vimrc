let mapleader = "\<Space>"

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
call plug#end()

set nocompatible

filetype plugin on
syntax on

let g:vimtex_view_method = 'zathura'
let g:user_emmet_leader_key=','
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:UltiSnipsListSnippets="<c-tab>"

set encoding=utf-8
set autoindent
set expandtab
set hidden
set history=3000
set hlsearch
set incsearch
set number
set relativenumber
set shiftwidth=2
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set undofile
set updatetime=300
set signcolumn=yes
set fillchars+=vert:.

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{GitBranchName()}
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set laststatus=2

hi Pmenu ctermbg=white ctermfg=black

highlight clear SignColumn

inoremap jj <Esc>

map j gj
map k gk

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

nmap <silent> ,/ :nohlsearch<cr>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

noremap <Space> <Nop>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nnoremap <silent><nowait><space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait><space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait><space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait><space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait><space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait><space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait><space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait><space>p  :<C-u>CocListResume<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! GitBranchName()
  return fugitive#head(7)
endfunction

augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd BufWritePre * %s/\s\+$//e
autocmd FileType tex setl updatetime=1
autocmd CursorHold * silent call CocActionAsync('highlight')

