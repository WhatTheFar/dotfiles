" == NERDTree ==
" GitHub : https://github.com/preservim/nerdtree
" Doc : https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt

autocmd StdinReadPre * let s:std_in=1

" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" == Override Default Mappings ==

let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'i'

let g:NERDTreeMapPreviewSplit = 'gs'
let g:NERDTreeMapPreviewVSplit = 'gi'
