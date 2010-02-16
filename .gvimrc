" GUI lines/columns 
"au GUIEnter * simalt ‾x
set lines=52
set columns=145

" GUI Font 
"set guioptions-=T
"set guifont=ARISAKA-等幅:h10

" Transparency
gui
"set transparency=235

" colorscheme
colorscheme slate
highlight LineNr guifg=darkyellow
highlight NonText guifg=grey40 guibg=NONE
highlight SpecialKey guifg=grey40
highlight Comment guifg=darkcyan

" IME Cursor
if has('multi_byte_ime') || has('xim')
    " Japan IME ON Cursor Color
    highlight CursorIM guibg=Purple guifg=NONE
endif
