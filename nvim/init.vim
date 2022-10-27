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

" nvim python3 configure
let g:python3_host_prog='~/.pyenv/versions/nvim-3.9.3/bin/python3.9'
let g:node_host_prog='~/.nodenv/versions/15.8.0/bin/neovim-node-host'
"set the vim plugin

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" search
if !empty(glob(g:python3_host_prog))
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    let g:Lf_ShortcutF = '<leader>ff'
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
    noremap <leader>f :Leaderf rg<Cr>
    noremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
    xnoremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
    noremap <leader>fr :<C-U>Leaderf! rg --recall<CR>
endif

let g:coc_global_extensions = [
    \'coc-json',
    \'coc-git',
    \'coc-html',
    \'coc-highlight',
    \'coc-explorer',
    \'coc-pyright',
    \'coc-pairs',
    \'coc-snippets',
    \'coc-markdownlint',
    \'coc-tsserver'
\]
if empty(glob(g:node_host_prog))
    Plug 'scrooloose/nerdtree'
    map <C-p> :NERDTreeToggle<CR>
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let g:NERDTreeWinPos="right"
    let g:NERDTreeShowHidden=1
    let g:NERDTreeMapOpenInTab='<ENTER>'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    nnoremap <C-p> :CocCommand explorer<CR>
    nnoremap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
    let g:coc_explorer_global_presets = {
                \   '.vim': {
                \     'root-uri': '~/.vim',
                \   },
                \   'cocConfig': {
                \      'root-uri': '~/.config/coc',
                \   },
                \   'tab': {
                \     'position': 'tab',
                \     'quit-on-open': v:true,
                \   },
                \   'floatingLeftside': {
                \     'position': 'floating',
                \     'floating-position': 'left-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingRightside': {
                \     'position': 'floating',
                \     'floating-position': 'right-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'simplify': {
                \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                \   },
                \   'buffer': {
                \     'sources': [{'name': 'buffer', 'expand': v:true}]
                \   },
                \ }
    nnoremap <Leader><C-p> :CocCommand explorer --preset floating<CR>
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'
endif
"https://qiita.com/delphinus/items/a202d0724a388f6cdbc3
"set termguicolors
set pb=10
"let winid = nvim_open_win(bufnr(''), v:false, {'relative': 'cursor', 'height': 3, 'width': 10, 'row': 1, 'col': 1})
augroup transparent-windows
  autocmd!
  autocmd User CocOpenFloat call setwinvar(g:coc_last_float_win, "&winblend", 15)
  "autocmd FileType coc set winblend=10
  "autocmd FileType  set winblend=10
augroup END

if has('nvim')
    Plug 'lambdalisue/suda.vim'
endif

Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
"Plug 'kien/tabman.vim'
Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'bfrg/vim-cpp-modern'
"Plug 'tpope/vim-capslock'

call plug#end()
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized

"augroup show_sapces
"    autocmd!
"    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"augroup END
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

let g:rainbow_active = 1
let g:vimwiki_list = [{'path': '~/.nb/home/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

nnoremap <Leader>wn <Plug>VimwikiNextLink

set nocompatible
if version >= 600
  filetype plugin indent on
endif

au FileType markdown setlocal foldlevel=99
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

exmap foldtoggle obcommand editor:toggle-fold
nmap za :foldtoggle
"let g:netrw_altv          = 1
"let g:netrw_fastbrowse    = 2
"let g:netrw_keepdir       = 0
"let g:netrw_liststyle     = 2
"let g:netrw_retmap        = 1
"let g:netrw_silent        = 1
"let g:netrw_special_syntax= 1
