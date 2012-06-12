set nocompatible                " choose no compatibility with legacy vi
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jpalardy/vim-slime'

filetype plugin indent on       " load file type plugins + indentation

" http://slinky.imukuppi.org/zenburnpage/
let g:zenburn_high_Contrast = 1
colors zenburn

" Slime plugin config
let g:slime_target = "tmux"

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " Enable line numbers

"" Show Invisibles
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>f :Ack 
nmap <leader>n :NERDTreeToggle<CR>

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" Some keyboard mappings from Janus
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

nmap <silent> ,. :bnext<CR>             " Next buffer
nmap <silent> ,m :bprev<CR>             " Previous buffer
set visualbell t_vb=                    " Silence bells
set nostartofline                       " When paging, don't go to the start of the line
set laststatus=2                        " show status line all the time
set scrolloff=5                         " don't scroll any closer to top/bottom
set backspace=2                         " Set for maximum backspace smartness

" Next tab
nmap <silent> ;' :tabnext<CR>
nmap <silent> ;l :tabprev<CR>

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smarttab                    " fix <BS> key
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Dealing with unsaved buffers
set hidden                      " Allow unsaved buffers
set confirm                     " Confirm all unsaved buffers on exit
