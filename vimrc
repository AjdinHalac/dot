set nocompatible " be iMproved, required
" Set shell to zsh (fish and VIM don't play well together)
set shell=zsh
"Don't dump distracting text to terminal during searches!
set shellpipe=2>/dev/null>
set clipboard=unnamedplus

""""""""""""""""""""""""
" Vundle setup + plugins
""""""""""""""""""""""""

filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Vim colorscheme and support for 256 colors
syntax on
syntax enable
set t_Co=256
colorscheme slate

""""""""""""""""
" General config
""""""""""""""""

set mouse=a
set guicursor=
set number              " Enable linenumbers
set hidden              " Leave hidden buffers open 
set history=10          " Save last 1000 commands
set showcmd             " Show incomplete cmds down the bottom
set autoread            " Reload files modified outside vim
set hlsearch            " Highlight search results
set incsearch           " Find the next match as we type the search
set laststatus=2        " Always show statusline
set autoindent          " Indent new lines
set smartindent         " Smart indents & tabs
set smarttab
set expandtab           " spaces instead of tabs
set shiftwidth=4        " Use four spaces for indent
set softtabstop=4
set tabstop=4
set splitright          " Open veritcal split right of current window
set splitbelow          " Open horizontal split below current window
set virtualedit=onemore 
" Display extra whitepsace like tabs and trailing spaces
set list
set list listchars=tab:->,trail:·,extends:#,nbsp:·


"""""""""""""""
" Plugin config
"""""""""""""""

" bling/vim-airline
"""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts   = 1
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" kien/ctrlp.vim
""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|vendor\|git|static\'

" xolox/vim-session
"""""""""""""""""""
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" airblade/vim-gitgutter
""""""""""""""""""""""""
" fix gutter colors according to https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" plasticboy/vim-markdown
"""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

" octol/vim-cpp-enhanced-highlight
"""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" mhinz/vim-startify
""""""""""""""""""""
let g:startify_session_dir = '~/.vim/sessions'

" grep using Silver Searcher (ag)
" http://robots.thoughtbot.com/faster-grepping-in-vim
""""""""""""""""""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"""""""""""""""""""
" Custom commands "
"""""""""""""""""""
let mapleader = ","

" easier window navigation (http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <Space> :NERDTreeToggle<CR>

