
let g:CtrlSpaceDefaultMappingKey = "<space>w "

" TAB in general mode will move to ctrlspace
nnoremap <silent> <TAB> :CtrlSpaceGoUp<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :CtrlSpaceGoDown<CR>

