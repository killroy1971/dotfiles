" My _vimrc file. For Windows VIM
"
" Glenn H. Snead
" Last change: 24 Mar 2017
"
" Notes: 
" To use it, copy it to
" %USERPROFILE%/
" You'll want to copy your vimfiles to %USERPROFILE%/vimfiles
" or create a link using an admin command prompt and this command
" junction "%USERPROFILE%/<vimfiles-source-path>" "%USRPROFILE%/vimfiles"

set nocompatible

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

" VIM for Windows Options
set guifont=Lucida_Console:h12:cDEFAULT
set lines=50 columns=120


" --UI Config--
set number                "Show line numbers.  :set nonumber to turn off
set showcmd               "Show last vim command in bottom right of screen
set cursorline            "Highlight current line
set wildmenu              "Use autocomplete in command mode (using <TAB>)
set lazyredraw            "Redraw screen only when necessary
set showmatch             "Highlight matching brackets [{()}]

" --Searching--
set incsearch      "Search as characters are entered
set hlsearch       "Highlight search matches


" --Vim File Backup--
set backup
" Trap for Windows machines: Use user's local "Temp" directory in
" AppData/Local
set backupdir=%USERPROFILE%\\AppData\\Local\\Temp
set backupskip=%USERPROFILE%\\AppData\\Local\\Temp
set directory=%USERPROFILE%\\AppData\\Local\\Temp
set undodir=%USERPROFILE%\\AppData\\Local\\Temp
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

