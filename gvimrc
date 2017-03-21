" My gvimrc file.
"
" Glenn H. Snead
" Last change: 27 Jul 2011	
"
" Notes 
" To use it, copy it to
"     for *nix, OSX, and Cygwin:  ~/.gvimrc
"           for Windows:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" Set the font
if has("gui_gtk2")
  set guifont=Monospace\ 14
elseif has("macunix")
  set guifont=Monaco:h14 
elseif has("gui_macvim")
  set guifont=Monaco:h14 
elseif has("win95","win64")
  set gufont=Courier_New:h14:cANSI:qDRAFT
endif

win 80 25 		" Window size
set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set lines=40
set columns=100

if exists("syntax_on")
	  syntax reset
endif

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

if version >= 500 " Only do this for Vim version 5.0 and later.

  let c_comment_strings=1 " Highlighting strings inside C comments

  " For Win32 version, have "K" lookup the keyword in a help file
  if has("win32")
    let winhelpfile='windows.hlp'
    map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  endif

  " Set nice colors
  highlight Normal guibg=Black guifg=Green " Bacground color = Black
  highlight Cursor guibg=Grey70 guifg=White " Cursor = green,
  "highlight lCursor guibg=Cyan guifg=NONE " or cyan when ':lmap' mappings are active
  highlight NonText guibg=Black " Text below the last line is dark grey
  highlight StatusLine     gui=bold       guibg=DarkGrey   guifg=Orange
  highlight StatusLineNC   guibg=DarkGrey   guifg=Orange
  highlight Constant       term=underline ctermfg=White 
  highlight Special        term=bold      ctermfg=Magenta
  highlight Search         ctermfg=Black      ctermbg=Yellow  guifg=Black    guibg=Yellow 

endif " If vim version is 5.0 or later
