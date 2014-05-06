set nocompatible                " choose no compatibility with legacy vi
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Set <leader> key to ,
let mapleader = ","

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
nmap <leader>f :Ack 

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

Bundle 'kien/ctrlp.vim'
nmap <leader>t :CtrlP<CR>
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
let g:ctrlp_max_files=32768

Bundle 'scrooloose/nerdtree'
nmap <leader>n :NERDTreeToggle<CR>

Bundle 'benmills/vimux'
Bundle 'skalnik/vim-vroom'
let g:vroom_use_vimux=1
let g:vroom_use_spring=1

" Cmd-Shift-R for RSpec
nmap <silent> <leader>r :VroomRunCurrentFile<CR>
" " Cmd-Shift-L for RSpec Current Line
nmap <silent> <leader>l :VroomRunCurrentLine<CR>

filetype plugin indent on       " load file type plugins + indentation

" http://slinky.imukuppi.org/zenburnpage/
let g:zenburn_high_Contrast = 1
colors zenburn

"" Show Invisibles
" nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
"set number                       Enable line numbers

set visualbell t_vb=                    " Silence bells
set nostartofline                       " When paging, don't go to the start of the line
set laststatus=2                        " show status line all the time
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file
set scrolloff=5                         " don't scroll any closer to top/bottom
set backspace=2                         " Set for maximum backspace smartness

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

" Key bindings from Ian

" Shortcut to rapidly toggle `set list`

nmap <leader>z :ZoomWin<CR>
nmap \\ :ZoomWin<CR>

map zz :ZoomWin<CR>

nmap <tab><tab> :tabnext<CR>
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <Tab>p :tabprevious<CR>
nmap <Tab>h :tabprevious<CR>
nmap <Tab>l :tabnext<CR>
nmap <Tab><Space> :tabnext<CR>
nmap <C-space> :tabnext<CR>

nmap <Tab><Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <Tab><Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

map <C-h> <C-w>h
map <C-l> <C-w>l

imap jj <Esc>

map vv :vsplit<CR>
map ss :split<CR>

" Key bindings from Carl
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %
nmap <silent> <leader>. :bnext<CR>             " Next buffer
nmap <silent> <leader>m :bprev<CR>             " Previous buffer


