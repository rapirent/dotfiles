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

if has('nvim')
  Plug 'benekastah/neomake'
endif

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
"Plug 'kien/tabman.vim'
Plug 'honza/vim-snippets'
"Plug 'vim-scripts/mru.vim'
Plug 'kshenoy/vim-signature'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/IndexedSearch'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

call plug#end()
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'


map <C-p> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" navigate windows with meta(alt)+arrows
map <S-Right> <c-w>l
map <S-Left> <c-w>h
map <S-Up> <c-w>k
map <S-Down> <c-w>j
imap <S-Right> <ESC><c-w>l
imap <S-Left> <ESC><c-w>h
imap <S-Up> <ESC><c-w>k
imap <S-Down> <ESC><c-w>j

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-e> :tabnew<CR>
map <S-e> :tabclose<CR>
"map <S-Right> :tabn<CR>
"map <S-Left> :tabp<CR>

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"auto syntax
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap {<CR> {<CR>}<Esc>ko

" ruler
let &colorcolumn="80,".join(range(120,999),",")
" copy and paste
"set clipboard+=unnamed  " use the clipboards of vim on win
set clipboard=unnamedplus

syntax on                   "highlight syntax
syntax enable               "same as above
set nu                      "monitor the line number
set expandtab               "以space取代tab
set cursorline              "monitor the cursor location
"set bg=dark                 "avoid losing comment syntax
set ruler                   "monitor 行,列 目前在文件的位置
set hlsearch                "highlight the search result設定高亮顯示搜尋結果
set confirm                 "ask when there is conflit
set history=50
set incsearch               "monitor fit tip
set cindent                 "C/C++ auto indent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set mouse=a                 "let mouse to visual

let NERDTreeWinPos="right"
let NERDTreeMapOpenInTab='<ENTER>'
let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized


filetype indent on          "indent according file format

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
