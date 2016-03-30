set nocompatible
set nobackup
set directory=~/.vim/swap

" basic config
set number
set ruler

" Indentation
set smartindent
set autoindent

" Matching brackets
set showmatch
runtime! macros/matchit.vim

" Search config
set incsearch
set ignorecase
set hlsearch

set encoding=utf8
set tenc=utf8

if &modifiable
  set fileencoding=utf8
  set ff=unix
endif

" Status bar
set laststatus=2 " statusline always visible
let g:Powerline_symbols = 'fancy' " Poweline plugin
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" Disable F1 from opening the help
" I can type :help perfectly fine, thank you very much
imap <F1> <Esc>
nmap <F1> <Esc>

" PEP 8 compliance
set expandtab
set textwidth=150
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

" mouse scrolling
set mouse=a

" use system registry by default
set clipboard=unnamed

syntax on

" Pathogen
execute pathogen#infect()

filetype plugin indent on

augroup MyAutoCommands
  " Clear old autocmds in group
  autocmd!

  " File types
  autocmd BufRead,BufNewFile *.haml                     setfiletype haml
  autocmd BufRead,BufNewFile *.sass,*.scss              setfiletype sass
  autocmd BufRead,BufNewFile config.ru,Gemfile,Isolate  setfiletype ruby
  autocmd BufRead,BufNewFile *.liquid,*.mustache        setfiletype liquid

  " Ruby files
  autocmd FileType ruby,eruby,      set sw=2 ts=2 sts=2 et
  autocmd FileType ruby,eruby,haml  imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

  autocmd FileType ruby             nnoremap <C-D> orequire "debugger"; debugger; ""<Esc>

  " HTML/HAML
  autocmd FileType html,haml   set shiftwidth=2 softtabstop=2 expandtab

  " Javascript
  autocmd FileType javascript  set shiftwidth=4 softtabstop=4 expandtab

  " CSS
  autocmd FileType sass,css    set shiftwidth=2 softtabstop=2 expandtab

  " Coffee
  autocmd FileType coffee      set shiftwidth=2 softtabstop=2 expandtab

  " Other langs
  autocmd FileType python,php  set shiftwidth=4 softtabstop=4 expandtab

  " Vim files
  autocmd FileType     vim     set shiftwidth=2 softtabstop=2 expandtab
  autocmd BufWritePost .vimrc  source $MYVIMRC

  " Auto-wrap text in all buffers
  autocmd BufRead,BufNewFile * set formatoptions+=t
augroup END

" colorscheme
colo railscasts

" disable toolbar in gui mode
if has("gui_running")
  set guioptions=egmrt
endif

" fonts
set guifont=Monaco\ 13

" debugger macro
map <Leader>d orequire 'ruby-debug';debugger<ESC>
map <Leader>p osave_and_open_page<ESC>

map <Leader>rt :!ctags -R `bundle show rails`/../* .<CR><CR> " Generate tags for my project

" NERDTree
map N :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" PLUGIN MANAGEMENT WITH VUNDLE
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/wincent/command-t
Plugin 'wincent/command-t'

" https://github.com/itchyny/lightline.vim
Plugin 'itchyny/lightline.vim'

" Bundles
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()

" Startup
" autocmd vimenter * NERDTree

" Buffers
set hidden
" Buffer switching
:nmap <C-e> :b#<CR>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

" Display buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1

" Pressing Tab or Shift-Tab will let you indent/unindent selected lines
vnoremap <S-Tab> <gv
vnoremap <Tab>    >gv"

" Set to auto read when a file is changed from the outside
set autoread

" don't move the cursor to the start of the line when scrolling
set nostartofline

" No startup messages
set shm+=atmI

" Sets how many lines of history VIM has to remember
set history=1000

" Use English for spellchecking, but don't spellcheck by default
set spl=en spell
set nospell

" NERDcommenter
" In visual mode Control-m toggle the coment state of the visually selected block
vnoremap <silent> <C-m> <ESC>:call NERDComment(1, "toggle")<cr>

" Remove ugly vertical pipe used by Vim to draw the vertical separator between windows
set fillchars-=vert:\| | set fillchars+=vert:\ 

