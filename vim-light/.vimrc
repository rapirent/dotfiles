if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        let s:OS = "OSX"
        set clipboard+=unnamed  " use the clipboards of vim on win
    else
        let s:OS = "linux"
        set clipboard=unnamedplus
    endif
else
    let s:OS = "windows"
    set clipboard+=unnamed  " use the clipboards of vim on win
endif
" copy and paste
" ruler
let &colorcolumn="80,".join(range(120,999),",")
let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10



syntax on                   "highlight syntax
syntax enable               "same as above
set nu                      "monitor the line number
set expandtab               "以space取代tab
set cursorline              "monitor the cursor location
set ruler                   "monitor 行,列 目前在文件的位置
set hlsearch                "highlight the search result設定高亮顯示搜尋結果
set confirm                 "ask when there is conflit
set history=1000
set incsearch               "monitor fit tip
set cindent                 "C/C++ auto indent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set mouse=a                 "let mouse to visual
set softtabstop=0
set fileencodings=utf-8,ucs-bom,big5,cp936,gb18030,gb2312,euc-jp,euc-kr,latin1
set synmaxcol=500

"auto syntax
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap {<CR> {<CR>}<Esc>ko
filetype indent on          "indent according file format

augroup files
    autocmd!
    autocmd FileType html,javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType python,php,c,cpp,java setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd FileType c,cpp,java set mps+==:;
    autocmd BufNewFile,BufFilePre,BufRead *.md setlocal noautoindent nocindent nosmartindent
augroup END
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"nnoremap <leader>v16 :e ++bin ++enc=ansi | %!xxd -g1<cr>
"nnoremap <leader>r16 %!xxd -r<cr>

nnoremap <silent> <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR> :retab<cr>
augroup trim_space
    autocmd!
    autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END
function! Hardmode()
    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>
    "imap <Left> <Nop>
    "imap <Right> <Nop>
    imap <Up> <Nop>
    imap <Down> <Nop>
    imap <BS> <Nop>
    imap <Del> <Nop>
    if s:OS == "OSX"
        nnoremap <Esc>h 5h
        nnoremap <Esc>j 5j
        nnoremap <Esc>k 5k
        nnoremap <Esc>l 5l
        inoremap <Esc>h <Left>
        inoremap <Esc>j <Down>
        inoremap <Esc>k <Up>
        inoremap <Esc>l <Right>
        vnoremap <Esc>h <Left>
        vnoremap <Esc>j <Down>
        vnoremap <Esc>k <Up>
        vnoremap <Esc>l <Right>
    else
        nnoremap <M-h> 5h
        nnoremap <M-j> 5j
        nnoremap <M-k> 5k
        nnoremap <M-l> 5l
        inoremap <M-h> <Left>
        inoremap <M-j> <Down>
        inoremap <M-k> <Up>
        inoremap <M-l> <Right>
    endif
    "inoremap <C>k <C-o>gk
    "inoremap <C>h <Left>
    "inoremap <C>l <Right>
    "inoremap <C>j <C-o>gj
    "nnoremap <C>k <C-w>k
    "nnoremap <C>h <C-w>h
    "nnoremap <C>l <C-w>l
    "nnoremap <C>j <C-w>j
endfunction

function! Easymode()
    silent! unmap <Right>
    silent! unmap <Left>
    silent! unmap <Up>
    silent! unmap <Down>
    silent! unmap <BS>
    silent! unmap <Del>
    silent! iunmap <Right>
    silent! iunmap <Left>
    silent! iunmap <Up>
    silent! iunmap <Down>
    silent! iunmap <BS>
    silent! iunmap <Del>
    if s:OS == "OSX"
        nnoremap <Esc>h 3h
        nnoremap <Esc>j 3j
        nnoremap <Esc>k 3k
        nnoremap <Esc>l 3l
        inoremap <Esc>h <Left>
        inoremap <Esc>j <Down>
        inoremap <Esc>k <Up>
        inoremap <Esc>l <Right>
        "nnoremap <M-h> 5h
        "nnoremap <M-j> 5j
        "nnoremap <M-k> 5k
        "nnoremap <M-l> 5l
        "inoremap <M-h> <Left>
        "inoremap <M-j> <Down>
        "inoremap <M-k> <Up>
        "inoremap <M-l> <Right>
    else
        nnoremap <M-h> 5h
        nnoremap <M-j> 5j
        nnoremap <M-k> 5k
        nnoremap <M-l> 5l
        inoremap <M-h> <Left>
        inoremap <M-j> <Down>
        inoremap <M-k> <Up>
        inoremap <M-l> <Right>
    endif
    "noremap <S-Right> <c-w>l
    "noremap <S-Left> <c-w>h
    "noremap <S-Up> <c-w>k
    "noremap <S-Down> <c-w>j
    "inoremap <S-Right> <ESC><c-w>l
    "inoremap <S-Left> <ESC><c-w>h
    "inoremap <S-Up> <ESC><c-w>k
    "inoremap <S-Down> <ESC><c-w>jnoremap <C-l> :tabn<CR>
    "noremap <C-h> :tabp<CR>
endfunction
call Easymode()
inoremap jk <Esc>
noremap <C-l> :tabn<CR>
noremap <C-h> :tabp<CR>
noremap <leader><S>e :tabnew<CR>
noremap <leader>c :tabclose<CR>
"use Shift_p to multi paste (copy same text after paste)
xnoremap <S-p> pgvy
"use Ctrl_o instead
"inoremap <Esc>x <Del>
"inoremap <M-x> <Del>
"inoremap <Esc>X <Esc>Xa
"inoremap <M-X> <Esc>Xa
"noremap <S-Right> :tabn<CR>
"noremap <S-Left> :tabp<CR>

"terminal
"noremap <C-q> :sh<cr>
noremap <C-a> :term<cr>


set nocompatible
if version >= 600
  filetype plugin indent on
endif

au FileType markdown setlocal foldlevel=99
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
