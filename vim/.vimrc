  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
  "               
  "               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
  "               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
  "               ██║   ██║██║██╔████╔██║██████╔╝██║     
  "               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
  "                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
  "                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
  "               
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

  " Allow mouse usage
  set mouse=a

  " Disable compatibility with vi which can cause unexpected issues.
  set nocompatible

  " Enable type file detection. Vim will be able to try to detect the type of file is use.
  filetype on

  " Enable plugins and load plugin for the detected file type.
  filetype plugin on

  " Load an indent file for the detected file type.
  filetype indent on

  " Turn syntax highlighting on.
  syntax on

  " Add numbers to the file.
  set number

  " Show relative line numbers
  set relativenumber

  " Do not save backup files.
  set nobackup

  " Do not let cursor scroll below or above N number of lines when scrolling.
  set scrolloff=10

  " While searching though a file incrementally highlight matching characters as you type.
  set incsearch

  " Ignore capital letters during search.
  set ignorecase

  " Override the ignorecase option if searching for capital letters.
  " This will allow you to search specifically for capital letters.
  set smartcase

  " Show partial command you type in the last line of the screen.
  set showcmd

  " Show the mode you are on the last line.
  set showmode

  " Show matching words during a search.
  set showmatch

  " Use highlighting when doing a search.
  set hlsearch

  " Set the commands to save in history default number is 20.
  set history=1000

  " Enable auto completion menu after pressing TAB.
  set wildmenu

  " Make wildmenu behave like similar to Bash completion.
  set wildmode=list:longest

  " There are certain files that we would never want to edit with Vim.
  " Wildmenu will ignore files with these extensions.
  set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

  colorscheme deus
  " PLUGINS ---------------------------------------------------------------- {{{

  "call plug#begin('~/.vim/plugged')
    "Plug 'dracula/vim', { 'as': 'dracula' }

    "Plug 'dense-analysis/ale'

    "Plug 'preservim/nerdtree'

 " call plug#end()

  " }}}

  " MAPPINGS --------------------------------------------------------------- {{{


  " }}}

  " STATUS LINE ------------------------------------------------------------ {{{
  set laststatus=2

    " }}}

