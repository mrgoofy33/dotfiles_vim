" Encode 
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8
""set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8

" LineNo/Ruler/List/Swap/Backup 
set nu
set ruler
set list
set swapfile
set nobackup

" Auto Indent 
set autoindent
"set noautoindent

" Tab Space Count 
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Tab or Space 
set expandtab
"set noexpandtab

" Yank Clipboard Use
set clipboard=unnamed

" Omni Tab Setting 
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction

"Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"buffer key map
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:Kwbd<CR>:bp<CR>
"map <F4> <ESC>:bw<CR>

"all select
map ,a <ESC>ggvG

"Parentheses key map
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" Tab/LF Display 
set listchars=tab:>.,extends:<,trail:-,eol:$

" String Color
colorscheme slate
highlight LineNr ctermfg=darkyellow
highlight NonText ctermfg=grey
highlight SpecialKey ctermfg=grey
highlight Comment ctermfg=darkcyan

" Zenkaku Space 
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guifg=lightblue guibg=lightblue
match ZenkakuSpace /　/

" Omni Popup Color 
highlight Pmenu guibg=#666666
highlight PmenuSel guibg=#8cd0d3 guifg=#666666
highlight PmenuSbar guibg=#333333

" IME Cursor
if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM cterm=underline ctermfg=NONE
endif

" taglist.vim/ctags Setting 
set tags=tags
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
map <silent> <leader>tl :TlistToggle<cr>

" buftabs.vim setting
" file path cut (file name only)
" buftabs in statusline display
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"

" StatusLine Setting 
"set statusline=%F%m%r%h%w\ [%{(&fenc!=''?&fenc:&enc)}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%{g:buftabs_list}%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
set laststatus=2

" Filetype Setting 
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.css set filetype=css
autocmd BufNewFile,BufRead *.php set filetype=php
autocmd BufNewFile,BufRead *.pl set filetype=perl
autocmd BufNewFile,BufRead *.pck,*.sql set filetype=sql

" templates Files
autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html
autocmd BufNewFile *.js 0r ~/.vim/templates/skel.js
autocmd BufNewFile *.as 0r ~/.vim/templates/skel.as
autocmd BufNewFile *.php 0r ~/.vim/templates/skel.php
autocmd BufNewFile *.pl 0r ~/.vim/templates/skel.pl

" neocomplcache Startup 
let g:NeoComplCache_EnableAtStartup=1
let g:NeoComplCache_DictionaryFileTypeLists = {
       \ 'default' : '',
       \ 'php' : '~/.vim/dict/PHP.dict',
       \ 'perl' : '~/.vim/dict/perl_function.dict',
       \ 'actionscript' : '~/.vim/dict/actionscript3.dict',
       \ 'javascript' : '~/.vim/dict/javascript.dict',
       \ 'css' : '~/.vim/dict/css.dict',
       \ }

" PHP Check 
" PHPLint
" @author halt feits <halt.feits at gmail.com>
" nmap ,l :call PHPLint()<CR>
"  function PHPLint()
"    let result = system( &ft . ' -l ' . bufname(""))
"    echo result
"  endfunction
autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" PHP Setting """
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1
let php_folding = 1

" perl Setting
let perl_fold=1

" Explore Setting
let g:netrw_browse_split=4
let g:netrw_winsize="25"
let g:netrw_liststyle=3
map <silent> <leader>ve :Vexplore<cr>

