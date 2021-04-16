" Neovim/Vim True Color support
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
set termguicolors

" == gruvbox ==
let g:gruvbox_contrast_dark = "hard"
" Most terminals don't handle italics right so gruvbox disables italics for terminals by default.
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
" override vim-airline theme
let g:airline_theme='gruvbox'
