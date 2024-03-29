set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

if !exists('g:vscode')
    syntax enable                           " Enables syntax highlighing
    set hidden                              " Required to keep multiple buffers open multiple buffers
    set nowrap                              " Display long lines as just one line
    " set encoding=utf-8                      " The encoding displayed
    set pumheight=10                        " Makes popup menu smaller
    " set fileencoding=utf-8                  " The encoding written to file
    set ruler              			            " Show the cursor position all the time
    set cmdheight=2                         " More space for displaying messages
    set mouse=a                             " Enable your mouse
    set splitbelow                          " Horizontal splits will automatically be below
    set splitright                          " Vertical splits will automatically be to the right
    set t_Co=256                            " Support 256 colors
    set conceallevel=0                      " So that I can see `` in markdown files
    set tabstop=2                           " Insert 4 spaces for a tab
    set softtabstop=2                       " Insert 4 spaces for a soft tab
    set shiftwidth=2                        " Change the number of space characters inserted for indentation
    set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
    set expandtab                           " Converts tabs to spaces
    set smartindent                         " Makes indenting smart
    set autoindent                          " Good auto indent
    set laststatus=2                        " Always display the status line
    set number                              " Line numbers
    set relativenumber                      " Relative Line numbers
    set cursorline                          " Enable highlighting of the current line
    set background=dark                     " tell vim what the background color looks like
    set showtabline=2                       " Always show tabs
    set noshowmode                          " We don't need to see things like -- INSERT -- anymore
    set nobackup                            " This is recommended by coc
    set nowritebackup                       " This is recommended by coc
    set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
    set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=100                      " Faster completion
    set timeoutlen=300                      " By default timeoutlen is 1000 ms
    " set clipboard=unnamedplus               " Copy paste between vim and everything else , for  Linux
    set clipboard=unnamed               " OSX
    set incsearch
    set guifont=Hack\ Nerd\ Font
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " set mmp=1300
    " set autochdir                           " Your working directory will always be the same as your working directory
    " set foldcolumn=2                        " Folding abilities

    set autowrite

    " au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Give more space for displaying messages.
    set cmdheight=2
    set smartcase
    set noswapfile
    set undodir=~/.vim/undodir
    set undofile

    set colorcolumn=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey

    " let g:netrw_browse_split = 2
    " let g:netrw_banner = 0
    " let g:netrw_winsize = 25

    " You can't stop me
    cmap w!! w !sudo tee %

    " Change cursor shape between insert and normal mode in iTerm2.app
    " https://hamberg.no/erlend/posts/2014-03-09-change-vim-cursor-in-iterm.html
    if $TERM_PROGRAM =~ "iTerm"
        let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
        let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    endif
endif
