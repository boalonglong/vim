" judge platform
function! Mysystem()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

colorscheme desert
set nocompatible
set autoread
set encoding=utf8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set nobackup

set number
set ruler
set linebreak
set textwidth=80
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set showtabline=2
set smarttab
set hlsearch       " highlight the searched items
set showmatch
set matchtime=2

set autoindent     " uses the indent from the previous line.
set smartindent    " like autoindent, but also recognizes some C syntax to increase/reduce the indent.
set cindent        " configurable to different indenting styles.
set cinoptions=N-s
set wrap
set cursorline
set formatoptions=tcrqn 
set noerrorbells 
set linespace=0 

filetype on
filetype plugin on
filetype indent on

let mapleader=","
let g:mapleader=","
let maplocalleader="\\"

nmap <leader>w :w!<cr>

if Mysystem() == "windows"
  map <leader>e :e! $VIM\_vimrc<cr>
  set gfn=Menlo:h14
  set backspace=indent,eol,start
else
  map <leader>e :e! ~/.vimrc<cr>
  autocmd! bufwritepost vimrc source ~/.vimrc
  set gfn=Monospace\ 10
endif

if has("autocmd") 
    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number 
    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o--> 
    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o 
    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100 
    autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim 
    autocmd BufReadPost * 
                \ if line("'\"") > 0 && line("'\"") <= line("$") | 
                \ exe " normal g`\"" | 
                \ endif 
endif "has("autocmd") 

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" use space key to turn on/off the fold.
set foldenable 
set foldmethod=manual 
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR> 

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" gui setting.
set guioptions-=T
set guioptions-=m
set guifont=Consolas

syntax on
