
" Hunk text object
" Remap from `ic` and `ac` to `ih` and `ah`
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

command! Gqf GitGutterQuickFix | copen
nmap <leader>hq :Gqf<CR>
