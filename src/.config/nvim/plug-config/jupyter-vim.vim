let maplocalleader=" "

" Always use the same virtualenv for vim, regardless of what Python
" environment is loaded in the shell from which vim is launched
let g:vim_virtualenv_path = $HOME .. "/.pyenv/versions/neovim"
if exists('g:vim_virtualenv_path')
    pythonx import os; import vim
    pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
    pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
endif

" Set let g:jupyter_mapkeys = 0 in your .vimrc to prevent the default keybindings from being made.
let g:jupyter_mapkeys = 0
