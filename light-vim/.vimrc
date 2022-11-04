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
set expandtab               "‰ª•spaceÂèñ‰ª£tab
set cursorline              "monitor the cursor location
set ruler                   "monitor Ë°å,Âàó ÁõÆÂâçÂú®Êñá‰ª∂ÁöÑ‰ΩçÁΩÆ
set hlsearch                "highlight the search resultË®≠ÂÆöÈ´ò‰∫ÆÈ°ØÁ§∫ÊêúÂ∞ãÁµêÊûú
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

nnoremap <C-p> :Explore!<CR>

inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap {<CR> {<CR>}<Esc>ko
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

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

set nocompatible
if version >= 600
  filetype plugin indent on
endif

au FileType markdown setlocal foldlevel=99

noremap <C-l> :tabn<CR>
noremap <C-h> :tabp<CR>
noremap <leader><S>e :tabnew<CR>
noremap <leader>c :tabclose<CR>
