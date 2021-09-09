vim.api.nvim_command "set relativenumber"

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

local override = {
	which_key = {
		opts = {
			mode = "n", -- NORMAL mode
			prefix = "",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
		vopts = {
			mode = "v", -- VISUAL mode
			prefix = "",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
		mappings = {},
		vmappings = {},
	},
}
lvim.builtin.which_key.on_config_done = function(wk)
	local opts = override.which_key.opts
	local vopts = override.which_key.vopts

	local mappings = override.which_key.mappings
	local vmappings = override.which_key.vmappings

	wk.register(mappings, opts)
	wk.register(vmappings, vopts)
end

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

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
lvim.keys.normal_mode["<A-j>"] = nil
lvim.keys.normal_mode["<A-k>"] = nil
lvim.keys.insert_mode["<A-j>"] = nil
lvim.keys.insert_mode["<A-k>"] = nil

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
override.which_key.mappings["[t"] = {
	"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
	"Prev Trouble",
}
override.which_key.mappings["]t"] = {
	"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
	"Next Trouble",
}

-- Spectre keymappings
lvim.builtin.which_key.mappings["S"] = {
	name = "+Spectre",
	s = { ":lua require('spectre').open()<CR>", "Spectre" },
	w = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Replace Current Word" },
	p = { "viw:lua require('spectre').open_file_search()<cr>", "Search Current File" },
}
lvim.builtin.which_key.vmappings["S"] = { ":lua require('spectre').open_visual()<CR>", "Spectre Visual " }

-- additional LSP keymappings
override.which_key.mappings["[g"] = {
	"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
	"Prev Diagnostic",
}
override.which_key.mappings["]g"] = {
	"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
	"Next Diagnostic",
}

-- additional gitsign.nvim keymappings
override.which_key.mappings["]c"] = {
	"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
	"Next hunk",
	expr = true,
}
override.which_key.mappings["[c"] = {
	"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
	"Prev hunk",
	expr = true,
}
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

-- gitlinker keymappings
lvim.builtin.which_key.mappings["gy"] = { "Link" }
lvim.builtin.which_key.vmappings["gy"] = { "Link" }

-- TODO: configure vim-fugitive
-- TODO: configure vim-go

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.which_key.setup.plugins.presets.operators = false
lvim.builtin.which_key.setup.plugins.presets.motions = false
lvim.builtin.which_key.setup.plugins.presets.text_objects = false
lvim.builtin.which_key.setup.ignore_missing = false

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#nvim-comment
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = false
lvim.builtin.treesitter.rainbow.enable = true

-- nvim-comment
lvim.builtin.comment.hook = function()
	-- https://github.com/LunarVim/LunarVim/issues/1134
	require("ts_context_commentstring.internal").update_commentstring()
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
-- TODO: enhance nvim-lsp-ts-utils code actions
local lsp = require "lsp"
lvim.lang.typescript.lsp.setup.on_attach = function(client, bufnr)
	lsp.common_on_attach(client, bufnr)

	-- disable tsserver formatting if you plan on formatting via null-ls
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	local ts_utils = require "nvim-lsp-ts-utils"

	-- defaults
	ts_utils.setup {
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,

		-- import all
		import_all_timeout = 5000, -- ms
		import_all_priorities = {
			buffers = 4, -- loaded buffer names
			buffer_content = 3, -- loaded buffer content
			local_files = 2, -- git files or files with relative path markers
			same_file = 1, -- add to existing import statement
		},
		import_all_scan_buffers = 100,
		import_all_select_source = false,

		-- eslint
		eslint_enable_code_actions = true,
		eslint_enable_disable_comments = true,
		eslint_bin = "eslint",
		eslint_config_fallback = nil,
		eslint_enable_diagnostics = false,
		eslint_show_rule_id = false,

		-- formatting
		enable_formatting = false,
		formatter = "prettier",
		formatter_config_fallback = nil,

		-- update imports on file move
		update_imports_on_move = false,
		require_confirmation_on_move = false,
		watch_dir = nil,

		-- filter diagnostics
		filter_out_diagnostics_by_severity = {},
		filter_out_diagnostics_by_code = {},
	}

	-- required to fix code action ranges and filter diagnostics
	ts_utils.setup_client(client)
end

-- react
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters

-- vue
lvim.lang.vue.formatters = {
	{
		exe = "prettier", -- can be prettierd eslint, or eslint_d as well
		args = {},
	},
}
lvim.lang.vue.linters = {
	{
		exe = "eslint_d", -- can be eslint_d as well
		args = {},
	},
}

-- json
lvim.lang.json.formatters = {
	{
		exe = "prettier",
		args = {},
	},
}

-- yaml
lvim.lang.yaml.formatters = {
	{
		exe = "prettier",
		args = {},
	},
}

-- tailwindcss
-- TODO: enable tailwindcss
-- lvim.lang.tailwindcss.active = true
-- require("lspconfig").tailwindcss.setup {}

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
	-- TODO: add abecodes/tabout.nvim
	-- TODO: add folke/zen-mode.nvim
	-- TODO: add folke/twilight.nvim
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
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufReadPre",
		config = function()
			require("indent_blankline").setup {
				-- char = "|",
				char = "▏",
				buftype_exclude = { "terminal", "nofile" },
				filetype_exclude = {
					"help",
					"startify",
					"dashboard",
					"packer",
					"neogitstatus",
					"NvimTree",
					"Trouble",
				},
				show_trailing_blankline_indent = false,
				show_first_indent_level = false,
				use_treesitter = true,
				show_current_context = true,
				context_patterns = {
					"class",
					"return",
					"function",
					"method",
					"^if",
					"^while",
					"jsx_element",
					"^for",
					"^object",
					"^table",
					"block",
					"arguments",
					"if_statement",
					"else_clause",
					"jsx_element",
					"jsx_self_closing_element",
					"try_statement",
					"catch_clause",
					"import_statement",
					"operation_type",
				},
			}
			-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
			vim.wo.colorcolumn = "99999"
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
	{ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" },

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
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
	{
		"vuki656/package-info.nvim",
		config = function()
			require("package-info").setup()
		end,
	},
	{ "simrat39/symbols-outline.nvim" },

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
