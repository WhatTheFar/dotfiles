vim.api.nvim_command "set relativenumber"
vim.api.nvim_command "set foldmethod=expr"
vim.api.nvim_command "set foldexpr=nvim_treesitter#foldexpr()"
vim.api.nvim_command "set foldlevel=1"
vim.api.nvim_command "set nofoldenable"

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
lvim.builtin.which_key.mappings["E"] = { ":Telescope file_browser<CR>", "File Browser" }
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
-- lvim.builtin.which_key.mappings["t"] = {
-- 	name = "+Trouble",
-- 	t = { "<cmd>TroubleToggle<cr>", "Trouble" },
-- 	w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- 	d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document Diagnostics" },
-- 	q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
-- 	l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
-- 	r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
-- 	f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
-- }
-- override.which_key.mappings["[t"] = {
-- 	"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
-- 	"Prev Trouble",
-- }
-- override.which_key.mappings["]t"] = {
-- 	"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
-- 	"Next Trouble",
-- }

-- Harpoon
lvim.builtin.which_key.mappings["H"] = {
	name = "+Harpoon",
	a = { ':lua require("harpoon.mark").add_file()<CR>', "Mark the file" },
	e = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Quick Menu" },
	["1"] = { ':lua require("harpoon.ui").nav_file(1)<CR>', "Navigate to file 1" },
	["2"] = { ':lua require("harpoon.ui").nav_file(2)<CR>', "Navigate to file 2" },
	["3"] = { ':lua require("harpoon.ui").nav_file(3)<CR>', "Navigate to file 3" },
	["4"] = { ':lua require("harpoon.ui").nav_file(4)<CR>', "Navigate to file 4" },
}

-- Quick Navigations
lvim.builtin.which_key.mappings["<space>"] = {
	name = "+More Navigations",
	["1"] = { "1gt", "Go to tab 1" },
	["2"] = { "2gt", "Go to tab 2" },
	["3"] = { "3gt", "Go to tab 3" },
	["4"] = { "4gt", "Go to tab 4" },
	a = { ':lua require("harpoon.mark").add_file()<CR>', "Mark file to Harpoon" },
	e = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon Quick Menu" },
}

-- Mode
lvim.builtin.which_key.mappings["m"] = {
	name = "+Mode",
	z = { "<cmd>ZenMode<cr>", "ZenMode" },
	t = { "<cmd>Twilight<cr>", "Twilight" },
}

-- Spectre keymappings
lvim.builtin.which_key.mappings["S"] = {
	name = "+Spectre",
	s = { ":lua require('spectre').open()<CR>", "Spectre" },
	w = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Replace Current Word" },
	p = { "viw:lua require('spectre').open_file_search()<cr>", "Search Current File" },
}
lvim.builtin.which_key.vmappings["S"] = { ":lua require('spectre').open_visual()<CR>", "Spectre Visual " }

-- Refactoring.nvim
lvim.builtin.which_key.vmappings["r"] = {
	name = "+Refactoring",
	r = {
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		"Refactorings",
	},
}

-- additional LSP keymappings
lvim.builtin.which_key.mappings["l"]["r"] = { "<cmd>lua require('renamer').rename()<cr>", "Renamer" } -- require 'filipdutescu/renamer.nvim'
override.which_key.mappings["[g"] = {
	"<cmd>lua vim.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
	"Prev Diagnostic",
}
override.which_key.mappings["]g"] = {
	"<cmd>lua vim.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
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

-- Neogit
lvim.builtin.which_key.mappings["G"] = { ":lua require('neogit').open({ kind = 'split'})<CR>", "Neogit" }

-- TODO: configure vim-fugitive
-- TODO: configure vim-go

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.notify.active = true

lvim.builtin.which_key.setup.plugins.presets.operators = false
lvim.builtin.which_key.setup.plugins.presets.motions = false
lvim.builtin.which_key.setup.plugins.presets.text_objects = false
lvim.builtin.which_key.setup.ignore_missing = false
lvim.builtin.which_key.setup.triggers_blacklist = {
	-- list of mode / prefixes that should never be hooked by WhichKey
	-- this is mostly relevant for key maps that start with a native binding
	-- most people should not need to change this
	n = { "d" },
}

lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#nvim-comment
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = false
lvim.builtin.treesitter.rainbow.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
	"go",
}

-- *Must* be *S*olidity not solidity
-- require("nvim-treesitter.parsers").get_parser_configs().solidity = {
-- 	install_info = {
-- 		url = "https://github.com/JoranHonig/tree-sitter-solidity",
-- 		files = { "src/parser.c" },
-- 		requires_generate_from_grammar = true,
-- 	},
-- 	filetype = "solidity",
-- }

-- Manually-configured servers
-- NOTE: Any changes to lvim.lsp.automatic_configuration.skipped_servers must be followed by :LvimCacheReset to take effect.
lvim.lsp.automatic_configuration.skipped_servers = {
	-- "tsserver",
}

local null_ls = require "null-ls"

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
	-- null_ls.builtins.code_actions.eslint,
	-- null_ls.builtins.code_actions.eslint_d,

	null_ls.builtins.code_actions.shellcheck,
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.goimports,

	null_ls.builtins.formatting.shfmt,

	null_ls.builtins.formatting.pg_format,
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	-- null_ls.builtins.diagnostics.eslint,
	-- null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.golangci_lint,
	null_ls.builtins.diagnostics.staticcheck,

	null_ls.builtins.diagnostics.shellcheck,

	null_ls.builtins.diagnostics.zsh,

	-- null_ls.builtins.diagnostics.actionlint, -- GitHub Actions
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
			vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
			vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
			vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

			local augend = require "dial.augend"

			require("dial.config").augends:register_group {
				default = {
					-- default
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.date.alias["%Y-%m-%d"],
					augend.date.alias["%m/%d"],
					augend.date.alias["%H:%M"],
					augend.constant.alias.ja_weekday_full,

					-- alias
					augend.constant.alias.bool,
					augend.semver.alias.semver,

					-- hexcolor
					augend.hexcolor.new {
						case = "lower",
					},

					-- custom constand
					augend.constant.new {
						elements = { "and", "or" },
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true, -- "or" is incremented into "and".
					},
					augend.constant.new {
						elements = { "&&", "||" },
						word = false,
						cyclic = true,
					},
				},
			}
		end,
	},
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {}
		end,
	},

	-- Navigations
	-- TODO: add abecodes/tabout.nvim
	{
		"nvim-telescope/telescope-file-browser.nvim",
		config = function() -- To get telescope-file-browser loaded and working with telescope,
			-- you need to call load_extension, somewhere after setup function:
			require("telescope").load_extension "file_browser"
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension "ui-select"
		end,
	},
	{
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup {}
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup {
				easing_function = "quadratic",
			}
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {
				plugins = {
					twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
				},
			}
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			-- If you have zen-mode installed, then Twilight is activated automatically.
			-- Refer to the Zen Mode documentation to disable.
			require("twilight").setup {}
		end,
	},
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
	{
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup {
				disable_commit_confirmation = true,
			}
		end,
	},
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"kyazdani42/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup()
	-- 	end,
	-- 	cmd = {
	-- 		"Octo",
	-- 		"OctoAddReviewComment",
	-- 		"OctoAddReviewSuggestion",
	-- 	},
	-- },

	-- Treesitter
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	{ "p00f/nvim-ts-rainbow" },
	-- already included
	-- { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup {
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
			}
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup {}
			require("telescope").load_extension "refactoring"
		end,
	},

	-- Language Pack
	{ "LunarVim/vim-solidity" },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	setup = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },
	{ "iamcco/markdown-preview.nvim" },
	{ "ellisonleao/glow.nvim", cmd = { "Glow", "GlowInstall" } },

	-- LSP Enhancement
	-- { "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"filipdutescu/renamer.nvim",
		branch = "develop", -- NOTE: usually use master; https://github.com/filipdutescu/renamer.nvim/issues/117
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("renamer").setup()
		end,
	},
	{
		"mizlan/iswap.nvim",
		cmd = { "ISwap", "ISwapWith" },
		config = function()
			require("iswap").setup()
		end,
	},
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
	{
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end,
	},
	{ "simrat39/symbols-outline.nvim" },

	-- Colorschemes
	{ "catppuccin/nvim", as = "catppuccin" },
	-- { "LunarVim/Colorschemes" },
	{ "lunarvim/darkplus.nvim" },
	{ "LunarVim/horizon.nvim" },
	{ "lunarvim/onedarker.nvim" },
	{ "LunarVim/tokyonight.nvim" },
	-- { "folke/tokyonight.nvim" },
	-- { "shaunsingh/oxocarbon.nvim", run = "./install.sh" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
