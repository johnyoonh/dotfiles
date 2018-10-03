"{{{ Init
set nocompatible               " be iMproved
if empty(glob("~/.vim/autoload/plug.vim"))
    echo "Installing Plug.."
    silent !mkdir -p ~/.vim/autoload
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    silent !git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
    silent !git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
    silent !~/.scm_breeze/install.sh
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-speeddating' " improve Ctrl-X and Ctrl-A increment
Plug 'tpope/vim-surround' "quoting/parenthesizing made simple
Plug 'tpope/vim-unimpaired' " matches more than just single characters
Plug 'scrooloose/nerdcommenter' " easy commenting

Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the gutter (sign column)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder.

Plug 'altercation/vim-colors-solarized'
Plug 'juanpabloaj/help.vim'
Plug 'bling/vim-airline'

call plug#end()


set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme solarized 
set background=dark
nnoremap Y y$
nmap s <Plug>Ysurroundiw
nmap S <Plug>YsurroundiW

set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
silent! set cryptmethod=blowfish2

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

" For MacVim
set noimd
set imi=1
set ims=-1

" ctags
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if exists("+undofile")
    set undofile         " use an undo file
    set undodir=/tmp//,.
    set undolevels=1000    " maximum number of changes that can be undone
    set undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif


" set complete=.,w,b,u,t
set complete-=i

" mouse
silent! set ttymouse=xterm2
set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline

" FOOBAR=~/<CTRL-><CTRL-F>
set isfname-==

if exists('&fixeol')
  set nofixeol
endif

    "{{{ CtrlP
        let g:ctrlp_cmd = 'CtrlPMRUFiles'
        let g:ctrlp_switch_buffer = 't'
        let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:50'
        if has('win32')
            let g:ctrlp_cache_dir = $HOME.'\Dropbox\dev\tmp\ctrlp_win'
        else
            let g:ctrlp_cache_dir = $HOME.'/Dropbox/dev/tmp/ctrlp'
        endif
        let g:ctrlp_mruf_max = 500
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>'],
            \ }
    "}}}
