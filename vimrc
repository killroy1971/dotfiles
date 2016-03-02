" My vimrc file.
"
" Glenn H. Snead
" Last change: 02 Oct 2015
"
" Notes: 
" To use it, copy it to
" for *nix, OSX, and Cygwin:  ~/.vimrc
"           for Windows:  $VIM\_vimrc
" --Begin Options--
colorscheme badwolf
syntax enable      "Enable syntax processing
filetype on        "Enable filetype aware highlighting
set tabstop=4      "Number of visual spaces per tab
set softtabstop=4  "Number of spaces per tab (edit mode)
set expandtab      "Change tabs to spaces (tabs aren't always good).
set smarttab       "Enable smarttab funciton
set autoindent     "Auto indent in known file types
set spl=en spell   "Spell check -- english dictionary

" --UI Config--
set number                "Show line numbers.  :set nonumber to turn off
set showcmd               "Show last vim command in bottom right of screen
set cursorline            "Highlight current line
set wildmenu              "Use autocomplete in command mode (using <TAB>)
set lazyredraw            "Redraw screen only when necessary
set showmatch             "Highlight matching brackets [{()}]
filetype plugin indent on "Load filetype-specific indentation files

" --Searching--
set incsearch      "Search as characters are entered
set hlsearch       "Highlight search matches

" --Load Add-Ins--
" Load pathogen
execute pathogen#infect()

" --Vim File Backup--
set backup
set backupdir=/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=/tmp
set writebackup

" --Autogroup--
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

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


