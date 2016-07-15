call plug#begin('~/.config/nvim/plugged')

Plug 'git://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'git://github.com/tomtom/tlib_vim.git'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-powerline'
Plug 'Rename'
Plug 'sickill/vim-pasta'
Plug 'The-NERD-tree'
Plug 'The-NERD-Commenter'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'garbas/vim-snipmate' 
Plug 'snipmate-snippets'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'

Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch

Plug 'tpope/vim-fugitive' " Git 
Plug 'sjl/threesome.vim'  " Perform three-way merges
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'jQuery'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'VimClojure'
Plug 'tpope/vim-fireplace'
Plug 'derekwyatt/vim-scala'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim' "{{{
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep'
  let g:unite_source_grep_recursive_opts = ''
endif

nnoremap <C-p> :Unite file_rec/async<cr>i
"}}}

let vimclojure#WantNailgun = 1
let vimclojure#UseErrorBuffer = 0
let vimclojure#SplitPos = "right"
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>N :NERDTreeClose<CR>
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks") " Store the bookmarks file
let NERDTreeShowBookmarks=1                                      " Show the bookmarks table on startup
let NERDTreeShowFiles=1                                          " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0                                         " Don't quit on opening files from the tree
let NERDTreeHighlightCursorline=1                                " Highlight the selected entry in the tree
let NERDTreeMouseMode=1                                          " Use a double click to fold/unfold directories and a double click to open files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ] " Don't display these kinds of files

call plug#end()

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
