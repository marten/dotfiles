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

let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git/', 'cd %s && git ls-files'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

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

