if &compatible
  set nocompatible
endif

filetype off

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Dein -------------------------- {{{
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
call dein#add('airblade/vim-gitgutter')
call dein#add('Raimondi/delimitMate')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('rip-rip/clang_complete')
call dein#add('zchee/deoplete-jedi')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tikhomirov/vim-glsl')
call dein#add('mattn/calendar-vim')
call dein#add('vimwiki/vimwiki', {'rev' : 'dev'})
call dein#add('blindfs/vim-taskwarrior')
call dein#add('tbabej/taskwiki')
call dein#add('powerman/vim-plugin-ansiesc')
call dein#add('majutsushi/tagbar')
call dein#add('MattesGroeger/vim-bookmarks')
call dein#add('wdicarlo/vim-notebook')
call dein#add('gyim/vim-boxdraw')
call dein#add('w0rp/ale')
call dein#end()
" }}}

"personal plugins
source ~/.config/nvim/plugins/statusline.vim

filetype plugin indent on
filetype on

"color theme
set t_Co=256
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
set foldmethod=indent
set foldlevel=99

"formatting -------------------- {{{
set modeline
set smarttab
set tabstop=2
set softtabstop=2
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
" }}}

"Custom mappings ------------------ {{{
let mapleader="\<Space>""move line down
map ; :
noremap ;; ;
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
" }}}

"Denite options --------------------- {{{
"Denite keybindings
nnoremap <C-p> :Denite file/rec<cr>
nnoremap <Leader>f :Denite file<cr>
nnoremap <Leader>/ :Denite grep:.<cr>
nnoremap <Leader>s :Denite buffer<cr>
" }}}

"deoplete settings ------------------------ {{{
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
"deoplete_clangx settings
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')
let g:clang_library_path='/usr/lib64/libclang.so.7'

"jedi settings
" let g:python3_host_prog = '/home/rearden/Documents/projects/email-parser/env/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

"set temp python variable here
" }}}

" Vimscript file settings -------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"fugitive settings -------------------- {{{
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Geddit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Gloh<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<SPACE>
nnoremap <Leader>gm :Gmove<SPACE>
nnoremap <Leader>gb :Git branch<SPACE>
nnoremap <Leader>go :Git checkout<SPACE>
"}}}

"gitgutter settings -------------------- {{{
let g:gitgutter_enabled = 0
nnoremap <Leader>gge :GitGutterEnable<CR>
nnoremap <Leader>ggd :GitGutterDisable<CR>
nnoremap <Leader>ggt :GitGutterToggle<CR>
"}}}

"tagbar settings ----------------------- {{{
nmap <F8> :TagbarToggle<CR>
"}}}

"vimwiki settings ---------------------- {{{
let g:vimwiki_list = [
                        \{'path': '~/vimwiki/personal'},
                        \{'path': '~/vimwiki/prerec'}
                    \]
"}}}

"vim-bookmarks settings ---------------- {{{
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrevious
nmap <Leader>mc <Plug>BookmarkClear
"}}}
