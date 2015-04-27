runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Help with tab completion in ex mode (opening files, remembering commands, etc)
set wildmenu
set wildmode=longest:full,full

" For use when creating own shortcuts
let mapleader = ","

" NerdTree
let NERDTreeIgnore = ['\.aux$']
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
"Set default width for NERDTree panel
let g:NERDTreeWinSize = 50

" Syntastic
let g:syntastic_javascript_checkers = ['jsxhint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

 " jsx syntax in .js files
 let g:jsx_ext_required = 0

" Tern
let tern#is_show_argument_hints_enabled = 1
" ternjs -- https://github.com/marijnh/tern_for_vim & http://usevim.com/2013/05/24/tern/
nmap <leader>td :TernDoc<CR>
nmap <leader>tt :TernType<CR>
nmap <leader>tb :TernDefPreview<CR>
nmap <leader>tr :TernRename<CR>

nmap <C-Up> V
