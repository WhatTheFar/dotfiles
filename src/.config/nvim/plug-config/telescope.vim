lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

" Telescope
nnoremap <leader>t :Telescope<CR>

" Project
" nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pt :lua require('telescope.builtin').tags()<CR>

" Current Buffer
nnoremap <leader>b/ :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>bt :lua require('telescope.builtin').current_buffer_tags()<CR>

" Search
nnoremap <leader>s/ :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>sb :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>sB :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" Others
nnoremap <leader>p :lua require('telescope.builtin').commands()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

" Custom
nnoremap <leader>vrc :lua require('whatthefar.telescope').search_dotfiles()<CR>
