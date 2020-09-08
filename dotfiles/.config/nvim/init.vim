"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Always source these
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/providers.vim
" source $HOME/.config/nvim/general/functions.vim
" source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/keys/mappings.vim
" source $HOME/.config/nvim/keys/which-key.vim

" Source depending on if VSCode is our client
if exists('g:vscode')
    source $HOME/.config/nvim/plug-config/easymotion.vim
else
    source $HOME/.config/nvim/themes/airline.vim
    source $HOME/.config/nvim/themes/colorschema.vim

    source $HOME/.config/nvim/plug-config/coc.vim
    source $HOME/.config/nvim/plug-config/coc-explorer.vim
    source $HOME/.config/nvim/plug-config/ctrlp.vim
    source $HOME/.config/nvim/plug-config/easy-motion.vim
    source $HOME/.config/nvim/plug-config/fzf.vim
    " source $HOME/.config/nvim/plug-config/nerdtree.vim
    source $HOME/.config/nvim/plug-config/quick-scope.vim
    source $HOME/.config/nvim/plug-config/vim-go.vim
    source $HOME/.config/nvim/plug-config/vim-fugitive.vim
    source $HOME/.config/nvim/plug-config/vim-polyglot.vim
    " source $HOME/.config/nvim/plug-config/ycm.vim
endif
