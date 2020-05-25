" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')

" == Surround ==
Plug 'tpope/vim-surround'
" == Better Comments ==
Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdcommenter'
" == Repeat stuff ==
Plug 'tpope/vim-repeat'

if exists('g:vscode')
    " == Text Navigation ==
    " -- Easy motion for VSCode --
    Plug 'asvetliakov/vim-easymotion'

else
    " == Text Navigation ==
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    Plug 'terryma/vim-multiple-cursors'

    " == File Browsing & Search ==
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'jremmen/vim-ripgrep' " conflict with fzf

    " == IntelliSense ==
    Plug 'ycm-core/YouCompleteMe'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " == Status Line ==
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " == Git & VCS ==
    Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'

    " == Colors ==
    Plug 'morhetz/gruvbox'

    " == Others ==
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    " Plug 'lyuts/vim-rtags'
    
endif

call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif