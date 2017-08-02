if &compatible
  set nocompatible
endif

filetype off

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('tomasr/molokai')
call dein#add('altercation/vim-colors-solarized')
call dein#add('rking/ag.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-commentary')
call dein#add('Raimondi/delimitMate')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('zchee/deoplete-clang')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tikhomirov/vim-glsl')

call dein#end()

"personal plugins
source ~/.config/nvim/plugins/statusline.vim

filetype plugin indent on
filetype on

"color theme
set t_Co=16
syntax enable
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
set number
set guifont=Inconsolata\ for\ Powerline\ 9
let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
set laststatus=2
set encoding=utf-8

"formatting
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent
set splitright
set splitbelow
set backspace=2
set backspace=indent,eol,start
let g:indent_guides_start_level=2
let g:indent_guides_size=1
let delimitMate_matchpairs = "(:),[:]"
inoremap {<cr> {<cr>}<c-o>O

"mappings
let mapleader="\<Space>""move line down
nnoremap <leader>- dd <bar> p
"[insert mode] uppercase current word
inoremap <c-u> <esc>viwUi
"[normal mode] uppercase current word
nnoremap <leader><c-u> viwU
"open this file in a new split for quick editing
nnoremap <leader>ev :split $MYVIMRC<cr>
"source this file
nnoremap <leader>sv :source $MYVIMRC<cr>
"super movement keys
nnoremap H ^
nnoremap L $
nnoremap $ <nop>
nnoremap ^ <nop>
"parantheses and bracket operator commands
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(vf)<cr>
onoremap al( :<c-u>normal! F)vF(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{vf}<cr>
onoremap al{ :<c-u>normal! F}vF{<cr>

"unite options
"unite keybindings
nnoremap <C-p> :Denite file_rec<cr>
nnoremap <Leader>f :Denite file<cr>
nnoremap <Leader>/ :Denite grep:.<cr>
nnoremap <Leader>s :Denite -quick-match buffer<cr>

"deoplete settings
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
augroup deoplete
  autocmd!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END
"tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"deoplete-clang settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'

