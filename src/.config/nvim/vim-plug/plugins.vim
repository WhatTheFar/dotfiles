" auto-install vim-plug
if empty(glob('~/.vim/plugged')
    silent !curl -fLo ~/.vim/plugged/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !ln -s ~/.vim/plugged/plug.vim ~/.vim/autoload/plug.vim
    " autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" == Surround ==
Plug 'tpope/vim-surround'
" == Better Comments ==
Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdcommenter'
" == Repeat stuff ==
Plug 'tpope/vim-repeat'
Plug 'rhysd/accelerated-jk'
" == Counter ==
Plug 'tpope/vim-speeddating'
" == Unimparied ==
Plug 'tpope/vim-unimpaired'

if exists('g:vscode')
    " == Text Navigation ==
    " -- Easy motion for VSCode --
    Plug 'asvetliakov/vim-easymotion'

else
    " == Syntax Highlighter ==
    Plug 'sheerun/vim-polyglot'         " Language packs
    " Plug 'pangloss/vim-javascript'    " JavaScript support
    " Plug 'leafgarland/typescript-vim' " TypeScript syntax
    " Plug 'jparise/vim-graphql'        " GraphQL syntax
    " Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

    " == Snippets ==
    Plug 'honza/vim-snippets'

    " == Language Server ==
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
    Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
    Plug 'nicwest/vim-http'

    " == Formatter ==
    " Plug 'tweekmonster/gofmt.vim'       " Run `gofmt` when you save
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'sbdchd/neoformat'

    " == Text Navigation ==
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    " Plug 'terryma/vim-multiple-cursors' " deprecated, use vim-visual-multi instead
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'liuchengxu/vista.vim'

    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'

    " == File Browsing & Search ==
    " Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'jremmen/vim-ripgrep' " conflict with fzf
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'vim-ctrlspace/vim-ctrlspace'
    Plug 'mhinz/vim-startify'

    " == IntelliSense ==
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " == Status Line ==
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " == Git & VCS ==
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'mbbill/undotree'

    " == Colors ==
    Plug 'morhetz/gruvbox'

    " == Others ==
    Plug 'vim-utils/vim-man'
    " Plug 'lyuts/vim-rtags'

    " == Integrations ==
    Plug 'jupyter-vim/jupyter-vim', { 'for': 'python' }

endif

call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
