if &compatible
  set nocompatible
endif

filetype off

" plugins -------------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'rking/ag.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'tikhomirov/vim-glsl'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki', {'rev' : 'dev'}
Plug 'blindfs/vim-taskwarrior'
" Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-ansiesc'
Plug 'majutsushi/tagbar'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'wdicarlo/vim-notebook'
Plug 'gyim/vim-boxdraw'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'SirVer/ultisnips'
" Plug 'itchyny/lightline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

"personal plugins
" source ~/.config/nvim/plugins/statusline.vim

filetype plugin indent on
filetype on

"color theme
if !has('gui_running')
  set t_Co=256
endif
syntax enable
set background=dark
let g:solarized_diffmode="high"
colorscheme solarized
set number
set guifont=Inconsolata\ for\ Powerline\ 9
set laststatus=2
set encoding=utf-8

"airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


"use ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ -S
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

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
let g:rust_reccomended_style = 0
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
"text movement
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>k :m-2<cr>gv=gv
"save current buffer
nnoremap <leader>w :w<cr>
"save and quit
nnoremap <leader>wq :wq<cr>
"open quickfix window
nnoremap <leader>cw :cwindow<cr>
" }}}

"Ctags ------------------------------ {{{
set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf ./tags<cr><cr>
" }}}

" fzf ----------------------------- {{{
nnoremap <C-p> :Files<cr>
nnoremap <leader>/ :Rg<cr>
" }}}

" ultisnips ------------------------ {{{
imap <C-l> <Plug>(coc-snippets-expand)
nnoremap <leader>us :UltiSnipsEdit<cr>
let g:UltiSnipsExpandTrigger = '<f5>'
let g:UltiSnipsSnippetsDir="~/.local/share/nvim/plugged/ultisnips/UltiSnips"
" }}}

"jedi settings
" let g:python3_host_prog = '/home/rearden/Documents/projects/email-parser/env/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

"set temp python variable here
" }}}

" coc --------------------------- {{{
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
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
                        \{'path': '~/vimwiki/prerec'},
                        \{'path': '~/vimwiki/ttrpg'},
                    \]

let g:vimwiki_table_mappings = 0
let g:vimiwiki_foldings='expr'
"}}}

"vim-bookmarks settings ---------------- {{{
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrevious
nmap <Leader>mc <Plug>BookmarkClear
"}}}
