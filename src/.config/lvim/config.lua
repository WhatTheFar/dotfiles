-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacedark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- ControlEscape debounce
lvim.keys.insert_mode["<C-h>"] = "<Esc>h"
lvim.keys.insert_mode["<C-j>"] = "<Esc>j"
lvim.keys.insert_mode["<C-k>"] = "<Esc>k"
lvim.keys.insert_mode["<C-l>"] = "<Esc>l"

-- use arrow to resize windows
lvim.keys.normal_mode["<Up>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<Down>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<Left>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<Right>"] = ":vertical resize +2<CR>"

-- remove default mappings from LunarVim
lvim.keys.normal_mode["<A-j>"] = ""
lvim.keys.normal_mode["<A-k>"] = ""

-- Telescope keymappings
lvim.builtin.which_key.mappings["sT"] = { ":Telescope<CR>", "Telescope" }
lvim.builtin.which_key.mappings["sw"] = {
	"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<CR>",
	"Search Word",
}
lvim.builtin.which_key.mappings["s/"] = {
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
	"Fuzzy Find Current Buf",
}
lvim.builtin.which_key.mappings["f"] = {
	"<cmd>lua require('telescope.builtin').git_files()<CR>",
	"Git Files",
}

-- Trouble keymappings
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	t = { "<cmd>TroubleToggle<cr>", "Trouble" },
	w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
	d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document Diagnostics" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
	f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
}

-- Spectre keymappings
lvim.builtin.which_key.mappings["S"] = {
	name = "+Spectre",
	s = { ":lua require('spectre').open()<CR>", "Spectre" },
	w = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Replace Current Word" },
	p = { "viw:lua require('spectre').open_file_search()<cr>", "Search Current File" },
}
lvim.builtin.which_key.vmappings["S"] = { ":lua require('spectre').open_visual()<CR>", "Spectre Visual " }

-- additional gitsign.nvim keymappings
vim.api.nvim_set_keymap(
	"n",
	"]c",
	"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
	{ noremap = true, silent = true, expr = true }
)
vim.api.nvim_set_keymap(
	"n",
	"[c",
	"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
	{ noremap = true, silent = true, expr = true }
)
-- text objects
vim.api.nvim_set_keymap(
	"o",
	"ih",
	':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"ih",
	':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	{ noremap = true, silent = true }
)

-- TODO: configure vim-fugitive
-- TODO: configure vim-go

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
-- TODO: use fzf for telescope
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = false
lvim.builtin.treesitter.rainbow.enable = true

-- nvim-comment
lvim.builtin.comment.on_config_done = function(nvim_comment)
	nvim_comment.setup {
		hook = function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
				require("ts_context_commentstring.internal").update_commentstring()
			end
		end,
	}
end

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- javascript
lvim.lang.javascript.formatters = {
	{
		exe = "prettier", -- can be prettierd eslint, or eslint_d as well
		args = {},
	},
}
lvim.lang.javascript.linters = {
	{
		exe = "eslint_d", -- can be eslint_d as well
		args = {},
	},
}

-- typescript
lvim.lang.typescript.formatters = {
	{
		exe = "prettier", -- can be prettierd eslint, or eslint_d as well
		args = {},
	},
}
lvim.lang.typescript.linters = {
	{
		exe = "eslint_d", -- can be eslint_d as well
		args = {},
	},
}

-- lua
lvim.lang.lua.formatters = {
	{
		exe = "stylua",
		args = {},
	},
}

-- Additional Plugins
lvim.plugins = {
	-- General
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{
		"monaqa/dial.nvim",
		event = "BufRead",
		config = function()
			local dial = require "dial"
			vim.cmd [[
    nmap <C-a> <Plug>(dial-increment)
      nmap <C-x> <Plug>(dial-decrement)
      vmap <C-a> <Plug>(dial-increment)
      vmap <C-x> <Plug>(dial-decrement)
      vmap g<C-a> <Plug>(dial-increment-additional)
      vmap g<C-x> <Plug>(dial-decrement-additional)
    ]]

			dial.augends["custom#boolean"] = dial.common.enum_cyclic {
				name = "boolean",
				strlist = { "true", "false" },
			}
			table.insert(dial.config.searchlist.normal, "custom#boolean")

			-- For Languages which prefer True/False, e.g. python.
			dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
				name = "Boolean",
				strlist = { "True", "False" },
			}
			table.insert(dial.config.searchlist.normal, "custom#Boolean")
		end,
	},
	{
		"folke/todo-comments.nvim",
		-- requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end,
	},

	-- Navigations
	{ "ggandor/lightspeed.nvim", event = "BufRead" },
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup {
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			}
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup {
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			}
		end,
	},

	-- Git
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = function()
			require("gitlinker").setup {
				opts = {
					-- remote = 'github', -- force the use of a specific remote
					-- adds current line nr in the url for normal mode
					add_current_line_on_normal_mode = true,
					-- callback for what to do with the url
					action_callback = require("gitlinker.actions").open_in_browser,
					-- print the url after performing the action
					print_url = false,
					-- mapping to call url generation
					mappings = "<leader>gy",
				},
			}
		end,
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},

	-- Treesitter
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	{ "p00f/nvim-ts-rainbow" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

	-- LSP Enhancement
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- Colorschemes
	{ "LunarVim/Colorschemes" },
	{ "folke/tokyonight.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
