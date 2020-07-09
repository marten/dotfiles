" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" 
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': { -> coc#util#install()}}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Linting engine
"Plug 'dense-analysis/ale'

Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" Fzf - file and buffer finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
"Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" Testing
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'jgdavey/tslime.vim'
"Plug 'tpope/vim-dispatch'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Ruby plugins === "
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers

" === Writing ===
Plug 'jceb/vim-orgmode'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" Syntax highlighting for coffeescript
Plug 'kchmck/vim-coffee-script'

Plug 'jparise/vim-graphql'
" Fish shell
Plug 'dag/vim-fish'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'tomasr/molokai'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


Plug 'scrooloose/nerdcommenter'

Plug 'danro/rename.vim'

" Initialize plugin system
call plug#end()

