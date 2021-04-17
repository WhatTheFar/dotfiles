" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1


nnoremap <silent> <leader>ot :Vista<CR>
nnoremap <silent> <leader>od :Vista!<CR>
nnoremap <silent> <leader>of :Vista finder<CR>
