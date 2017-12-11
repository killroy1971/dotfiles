" My vimrc file.
"
" Glenn H. Snead
" Last change: 24 Mar 2017
"
" Notes: 
" To use it, copy it to
" for *nix, OSX, and Cygwin:  ~/.vimrc
"           for Windows:  $VIM\_vimrc

" --Load Add-Ins--
" Load pathogen and enable syntax processing
execute pathogen#infect()
syntax enable      "Enable syntax processing
filetype on        "Enable filetype aware highlighting
filetype plugin indent on "Load filetype-specific indentation files
set autoindent     "Auto indent in known file types
autocmd FileType yaml setl indentkeys-=<:>

" --General UI Options--
colorscheme badwolf
set tabstop=2      "Number of visual spaces per tab
set softtabstop=2  "Number of spaces per tab (edit mode)
set shiftwidth=2
set expandtab      "Change tabs to spaces (tabs aren't always good).
set smarttab       "Enable smarttab funciton
"set spl=en spell   "Spell check -- english dictionary

" --UI Config--
"set number                "Show line numbers.  :set nonumber to turn off
set showcmd               "Show last vim command in bottom right of screen
set cursorline            "Highlight current line
set wildmenu              "Use autocomplete in command mode (using <TAB>)
set lazyredraw            "Redraw screen only when necessary
set showmatch             "Highlight matching brackets [{()}]

" --Searching--
set incsearch      "Search as characters are entered
set nohlsearch       "Do not highlight search matches


" --Vim File Backup--
if has("win32") || has("win64") 
  set backupdir=%USERPROFILE%\\AppData\\Local\\Temp
  set backupskip=%USERPROFILE%\\AppData\\Local\\Temp
  set directory=%USERPROFILE%\\AppDAta\\Local\\Temp
  set undodir=%USERPROFILE%\\AppDAta\\Local\\Temp
elseif has("win32unix")
  set backupdir=$USERPROFILE/AppData/Local/Temp
  set backupskip=$USERPROFILE/AppData/Local/Temp
  set directory=$USERPROFILE/AppDAta/Local/Temp
  set undodir=$USERPROFILE/AppDAta/Local/Temp
else
  if isdirectory($HOME . '/.vim-backup' ) == 0
    :silent !mkdir -p $HOME/.vim-backup > /dev/null 2>&1
  endif
  set backupdir=~/.vim-backup/
  set backupskip=/tmp/*,/private/tmp/*
  set directory=~/.vim-backup/
  set undodir=~/.vim-backup/
  set backup
endif
set writebackup

" --Functions--
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

