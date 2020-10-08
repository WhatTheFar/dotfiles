" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')
    " Simulate same TAB behavior in VSCode
    nmap <Tab> :Tabnext<CR>
    nmap <S-Tab> :Tabprev<CR>

else
    " == Customize ==
    " nnoremap <leader>f :Files<CR>
    nnoremap <C-p> :Files<CR>
    nnoremap <leader>g :GFiles -oc --exclude-standard<CR>
    nnoremap <leader>p :Commands<CR>
    " nnoremap <leader>b :Buffers<CR>
    " nnoremap <leader>t :NERDTreeFocus<CR>
    nnoremap <leader>e :CocCommand explorer<CR>
    nnoremap <leader>u :UndotreeShow<CR>

    "nnoremap <leader>pv <C-w>v<bar> :Ex <bar> :vertical resize 30<CR>
    " nnoremap <leader>ps :Rg<SPACE>

    " Source vimrc
    nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
    " Move Line Up
    vnoremap K :m '<-2<CR>gv=gv
    " Move Line Down
    vnoremap J :m '>+1<CR>gv=gv


    " TAB in general mode will move to text buffer
    nnoremap <silent> <TAB> :bnext<CR>
    " SHIFT-TAB will go back
    nnoremap <silent> <S-TAB> :bprevious<CR>

    " Alternate way to save
    " nnoremap <silent> <C-s> :w<CR>
    " Alternate way to quit
    " nnoremap <silent> <C-Q> :wq!<CR>
    " Use control-c instead of escape
    " nnoremap <silent> <C-c> <Esc>
    " <TAB>: completion.
    " inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

    " Better window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <leader>h <C-w>h
    nnoremap <leader>j <C-w>j
    nnoremap <leader>k <C-w>k
    nnoremap <leader>l <C-w>l

    " Terminal window navigation
    " tnoremap <C-h> <C-\><C-N><C-w>h
    " tnoremap <C-j> <C-\><C-N><C-w>j
    " tnoremap <C-k> <C-\><C-N><C-w>k
    " tnoremap <C-l> <C-\><C-N><C-w>l
    " inoremap <C-h> <C-\><C-N><C-w>h
    " inoremap <C-j> <C-\><C-N><C-w>j
    " inoremap <C-l> <C-\><C-N><C-w>l
    " inoremap <C-k> <C-\><C-N><C-w>k
    " tnoremap <Esc> <C-\><C-n>
    tnoremap <C-o> <C-\><C-n>

    " Use alt + hjkl to resize windows
    nnoremap <silent> <M-j>    :resize -2<CR>
    nnoremap <silent> <M-k>    :resize +2<CR>
    nnoremap <silent> <M-h>    :vertical resize -2<CR>
    nnoremap <silent> <M-l>    :vertical resize +2<CR>
    " nnoremap <silent> <Leader>+ :vertical resize +5<CR>
    " nnoremap <silent> <Leader>- :vertical resize -5<CR>

    fun! GoYCM()
        nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
        nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
        nnoremap <buffer> <silent> <leader>gf :YcmCompleter FixIt<CR>
        nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
    endfun

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    fun! GoCoc()
        inoremap <buffer> <silent><expr> <TAB>
                    \ pumvisible() ? "\<C-n>" :
                    \ <SID>check_back_space() ? "\<TAB>" :
                    \ coc#refresh()

        inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
        inoremap <buffer> <silent><expr> <C-space> coc#refresh()

        " GoTo code navigation.
        nmap <buffer> <leader>gd <Plug>(coc-definition)
        nmap <buffer> <leader>gy <Plug>(coc-type-definition)
        nmap <buffer> <leader>gi <Plug>(coc-implementation)
        nmap <buffer> <leader>gr <Plug>(coc-references)
        nnoremap <buffer> <leader>cr :CocRestart
    endfun

    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd BufWritePre * :call TrimWhitespace()
    " autocmd FileType typescript :call GoYCM()
    " autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()
endif
