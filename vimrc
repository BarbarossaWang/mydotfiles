" Comments in Vimscript start with a `"`.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
set encoding=utf-8

" Turn on syntax highlighting.
syntax on

filetype on
filetype plugin on
filetype indent on

" set spell " spell checking
" set lbr " line break 
set shortmess+=I " Disable the default Vim startup message.
set number " Show line numbers.
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]
set scrolloff=12 " Keep cursor in approximately the middle of the screen
set showcmd " displays keystrokes in statusline as you enter them

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

set hlsearch " highlight search

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of sapces in tab when editing
set shiftwidth=4 " Insert 4 spaces on a tab
set expandtab " tabs are spaces, mainly because of python

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Give more space for displaying message
set cmdheight=1

" Having longer updatetime (default is 4000 ms) leads to noticeable
" delays and poor user experience
set updatetime=300

"---------------------
" Key map configuration
"---------------------

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
" previous buffer
nnoremap <F2> :bp<CR>
" next buffer
nnoremap <F3> :bn<CR>
" temp shell
nnoremap <F8> :sh<CR>
" write all
nnoremap <F4> :wa<CR>

"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ctrlp

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_symbols_ascii = 1
let g:airline#extensions#keymap#enabled = 1

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

