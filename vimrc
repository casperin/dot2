set nocompatible    " vim, not vi
set encoding=utf-8  " Use utf-8 as standard

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" set backup dirs
set backupdir=~/.vim/swp_backups//
set directory=~/.vim/swp_backups//

set ruler           " position of cursor
set number          " line number
set showcmd         " commands
set hidden          " supress warning when switching away from an unsaved buffer
set t_Co=256        " We will assume we're in a terminal that has 256 colors to work with
set shiftwidth=4    " Tabs width
set tabstop=4       " Tabs width
set expandtab       " Insert spaces and not tabs
set autoindent      " auto indent
set smartindent     " smart indent
set smarttab        " tab and backspace are smart
set backspace=indent,eol,start  " Makes backspace work like in most other programs
set linebreak       " don't makes line breaks in the middle of a word
set incsearch       " incremental search
set ignorecase      " ignore cases in searches, unless...
set smartcase       " case-sensitive if search contains an uppercase character
let g:loaded_matchparen= 1  " Don't highlight matching brackets
set suffixesadd+=.js " so `gf` works with requireJS
" Help with tab completion in ex mode (opening files, remembering commands, etc)
set wildmenu
set wildmode=longest:full,full

" Function to strip white space
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" fire stripping white space on saving the file
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

" For use when creating own shortcuts
let mapleader = ","

" NerdTree
let NERDTreeIgnore = ['\.aux$']
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
"Set default width for NERDTree panel
let g:NERDTreeWinSize = 50

" Syntastic
"let g:syntastic_javascript_checkers = ['jsxhint']
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jsxhint']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0        " No signs in the gutter

 let g:jsx_ext_required = 0             " jsx syntax in .js files

" ternjs -- https://github.com/marijnh/tern_for_vim & http://usevim.com/2013/05/24/tern/
let tern#is_show_argument_hints_enabled = 1
nmap <leader>td :TernDoc<CR>
nmap <leader>tt :TernType<CR>
nmap <leader>tb :TernDefPreview<CR>
nmap <leader>tr :TernRename<CR>

" Navigating buffers
nmap <Left> :bp<CR>
nmap <Right> :bn<CR>
nmap <Up> :b#<CR>
nmap <Down> :ls<CR>

:nmap <Leader>s :source $MYVIMRC

map fun<Tab> function () {<Esc>o}<Esc>k0f(
nmap fun<Tab> ifunction () {<Esc>o}<Esc>k0f(
