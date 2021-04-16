autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

" nnoremap <leader>. :edit %:h<CR>


" == Auto-clean fugitive buffers ==
" Each time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with fugitive buffers.

" Here’s an autocommand that prevents this from becomming an issue:
autocmd BufReadPost fugitive://* set bufhidden=delete


" == Key Mappings ==
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
