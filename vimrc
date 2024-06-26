" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible
set shell=bash
filetype off

let mapleader = ","
let maplocalleader = "\\"

call plug#begin('~/.vim/plugged')
" Vundle configuration, and config for each bundle {{{
" Deps
Plug 'git://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'git://github.com/tomtom/tlib_vim.git'

" General
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'nicwest/vim-workman'

" Change surrounding stuff (e.g. cs'" to change ' to ")
Plug 'tpope/vim-surround'
"
" " Better repeats with .
Plug 'tpope/vim-repeat'
"
" " Rename the current file and update buffer (:Rename)
Plug 'tpope/vim-eunuch'
"
Plug 'sickill/vim-pasta'
"Plug 'jgdavey/tslime.vim'
"Plug 'jgdavey/vim-turbux'

Plug 'janko-m/vim-test'
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>ts :TestNearest<CR>
nmap <silent> <leader>tv :TestFile<CR>   
nmap <silent> <leader>ta :TestSuite<CR>  
nmap <silent> <leader>tl :TestLast<CR>   
nmap <silent> <leader>tt :TestLast<CR>   
nmap <silent> <leader>tg :TestVisit<CR>  

Plug 'dkprice/vim-easygrep'
let g:EasyGrepCommand=1
let grepprg='ag'
"
" " ctrl-p to jump between files
Plug 'kien/ctrlp.vim'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'cd %s && git ls-files'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" " General Programming
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'elixir-lang/vim-elixir'

" " Live syntax checking
Plug 'w0rp/ale'
Plug 'tpope/vim-endwise'

" Git and other versiony things
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'mhinz/vim-signify'

Plug 'garbas/vim-snipmate'
let g:snipMate = { 'snippet_version' : 1 }
Plug 'scrooloose/snipmate-snippets'

" " Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'

" " JavaScript
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'ryanolsonx/vim-lsp-typescript'
Plug 'MaxMEllon/vim-jsx-pretty'

" Clojure
" Plug 'VimClojure'
" let vimclojure#WantNailgun = 1
" let vimclojure#UseErrorBuffer = 0
" let vimclojure#SplitPos = "right"
" let g:vimclojure#HighlightBuiltins = 1
" let g:vimclojure#ParenRainbow = 1

Plug 'rhysd/vim-crystal'

" Scala
Plug 'derekwyatt/vim-scala'
"
Plug 'tpope/vim-fireplace'
"
Plug 'scrooloose/nerdtree'
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

Plug 'scrooloose/nerdcommenter'
" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" Languages
" Plug 'sjl/threesome.vim'
" }}}

call plug#end()



filetype plugin indent on       " enable detection, plugins and indenting in one step


" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is four spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set numberwidth=5               " good for 9999 lines before it starts to take on a different length
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
"set listchars=tab▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default, but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator supports it (xterm does)
set fileformats="unix,dos,mac"
set noeol                       " prevent vim from adding that stupid empty line at the end of every file
set binary                      " this needs to be on for the above to work
set expandtab                   " expand tabs by default (overloadable per file type later)
"set toolbar=                    " don't show the toolbar in gvim

set completeopt=longest,menu,preview " Autocomplete to longest common substring, then show menu, and more info in preview window if available

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
" nnoremap / /\v
" vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=0            " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
" }}}

" Editor layout {{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high
set guioptions=aegiLt

augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
" }}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
                                " ignore these files when completing names and in Explorer
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal
"set cursorline                  " underline the current line, for quick orientation

" Tame the quickfix window (open/close using ,f)
nmap <silent> <leader>f :QFix<CR>

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

augroup BWCCreateDir
    au!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END
" }}}

" Highlighting {{{
if &t_Co >= 256 || $COLORTERM == 'gnome-terminal' || has("gui_running")
	set t_Co=256
	set background=dark
	colorscheme molokai
endif

if &t_Co > 2 || has("gui_running")
   syntax on                    " switch syntax highlighting on, when the terminal has colors
endif

hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black
" }}}

" Shortcut mappings {{{
" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, since we don't have to press that annoying Shift key that
" slows the commands down
nnoremap ; :

" Why isn't this in by default, it's not like W does anything?
command! W w

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" ,e to switch between 2 last buffers
nmap <leader>e :b#<CR>

" ga to switch between implementation and test
nmap ga :A<cr>

" Please move through long wrapped lines logically
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Quick yanking to the end of the line
nmap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
set clipboard=unnamed

" YankRing stuff
let g:yankring_history_dir = '$HOME/.vim/.tmp'
nmap <leader>r :YRShow<CR>

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap <CR> :nohlsearch<cr>

imap <c-l> <space>=><space>

" Quickly get out of insert mode without your fingers having to leave the
" home row ('jj' only, 'jk' doesn't work well with Dutch "-ijk"-words)
inoremap jj <Esc>

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nmap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Scratch
nmap <leader><tab> :Sscratch<CR><C-W>x<C-J>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Run Ack fast (mind the trailing space here, wouldya?)
nnoremap <leader>a :Ack<space>

" Creating folds for tags in HTML
"nnoremap <leader>ft Vatzf

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]


" Multipurpose tab key: (as per Gary Bernhardt's vim)
" Will indent when we're at the beginning of a line
" Will autocomplete elsewhere.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}}

" For latex, enable wrapping
autocmd filetype latex set wrap
autocmd filetype latex map ,c :w\|!rubber -d %<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autowriteall        " Automatically save before commands like :next and :make
"set history=1000

"" highlight trailing whitespace
set listchars=tab:▷⋅,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stolen from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

nnoremap <leader><leader> <c-^>

function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()

map <leader>p :call PromoteToLet()<cr>

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    %s/\($\n\s*\)\+\%$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set winwidth=78
"set winheight=5
"set winminheight=5
"set winheight=999
"
if has("gui_running")
  set guifont="Input Mono 12"
endif