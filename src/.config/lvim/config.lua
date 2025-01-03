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

	-- https://github.com/sindrets/diffview.nvim/issues/217
	-- vim.api.nvim_create_autocmd("BufWinEnter", {
	-- 	pattern = "DiffviewFilePanel",
	-- 	callback = function(ctx)
	-- 		local thisOpts = {
	-- 			mode = "n", -- NORMAL mode
	-- 			prefix = "<leader>",
	-- 			buffer = ctx.buf,
	-- 			silent = true,
	-- 			noremap = true,
	-- 			nowait = true,
	-- 		}
	-- 		local mapping = {
	-- 			["<tab>"] = { "", "Open the diff for next file" },
	-- 			["<s-tab>"] = { "", "Open the diff for next file" },

	-- 			["<leader>e"] = { "", "Focus file panel" },
	-- 			["<leader>b"] = { "", "Toggle file panel" },

	-- 			["[x"] = { "", "Previous conflict" },
	-- 			["]x"] = { "", "Next conflict" },
	-- 		}
	-- 		wk.register(mapping, thisOpts)
	-- 	end,
	-- })

	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	pattern = "DiffviewFiles",
	-- 	callback = function(ctx)
	-- 		local opts = {
	-- 			mode = "n", -- NORMAL mode
	-- 			prefix = "<leader>",
	-- 			buffer = ctx.buf,
	-- 			silent = true,
	-- 			noremap = true,
	-- 			nowait = true,
	-- 		}
	-- 		local mapping = {
	-- 			["a"] = { "", "Work" },
	-- 			-- ["<leader>c"] = { "", "Conflict" },
	-- 			-- ["<leader>co"] = { "", "Choose the OURS version of a conflict" },
	-- 			-- ["<leader>ct"] = { "", "Choose the THEIRS version of a conflict" },
	-- 			-- ["<leader>cb"] = { "", "Choose the BASE version of a conflict" },
	-- 			-- ["<leader>ca"] = { "", "Choose all the versions of a conflict" },
	-- 			-- ["dx"] = { "", "Delete the conflict region" },
	-- 		}
	-- 		wk.register(mapping, opts)
	-- 	end,
	-- })
end

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
lvim.colorscheme = "catppuccin"

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
lvim.builtin.which_key.mappings["1"] = { "1gt", "Go to tab 1" }
lvim.builtin.which_key.mappings["2"] = { "2gt", "Go to tab 2" }
lvim.builtin.which_key.mappings["3"] = { "3gt", "Go to tab 3" }
lvim.builtin.which_key.mappings["4"] = { "4gt", "Go to tab 4" }
lvim.builtin.which_key.mappings["<space>"] = {
	name = "+More Navigations",
	["1"] = { "1gt", "Go to tab 1" },
	["2"] = { "2gt", "Go to tab 2" },
	["3"] = { "3gt", "Go to tab 3" },
	["4"] = { "4gt", "Go to tab 4" },
	a = { ':lua require("harpoon.mark").add_file()<CR>', "Mark file to Harpoon" },
	e = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon Quick Menu" },
	s = { ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', "Switch Git Worktree" },
	c = { ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', "Create Git Worktree" },
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

-- gh.nvim
lvim.builtin.which_key.mappings["g"]["h"] = {
	name = "+Github",
	c = {
		name = "+Commits",
		c = { "<cmd>GHCloseCommit<cr>", "Close" },
		e = { "<cmd>GHExpandCommit<cr>", "Expand" },
		o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
		p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
		z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
	},
	i = {
		name = "+Issues",
		p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
	},
	l = {
		name = "+Litee",
		t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
	},
	r = {
		name = "+Review",
		b = { "<cmd>GHStartReview<cr>", "Begin" },
		c = { "<cmd>GHCloseReview<cr>", "Close" },
		d = { "<cmd>GHDeleteReview<cr>", "Delete" },
		e = { "<cmd>GHExpandReview<cr>", "Expand" },
		s = { "<cmd>GHSubmitReview<cr>", "Submit" },
		z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
	},
	p = {
		name = "+Pull Request",
		c = { "<cmd>GHClosePR<cr>", "Close" },
		d = { "<cmd>GHPRDetails<cr>", "Details" },
		e = { "<cmd>GHExpandPR<cr>", "Expand" },
		o = { "<cmd>GHOpenPR<cr>", "Open" },
		p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
		r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
		t = { "<cmd>GHOpenToPR<cr>", "Open To" },
		z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
	},
	t = {
		name = "+Threads",
		c = { "<cmd>GHCreateThread<cr>", "Create" },
		n = { "<cmd>GHNextThread<cr>", "Next" },
		t = { "<cmd>GHToggleThread<cr>", "Toggle" },
	},
}

-- TODO: configure vim-fugitive
-- TODO: configure vim-go

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true

lvim.builtin.which_key.setup.plugins.presets.operators = false
lvim.builtin.which_key.setup.plugins.presets.motions = false
lvim.builtin.which_key.setup.plugins.presets.text_objects = false
lvim.builtin.which_key.setup.plugins.presets.windows = false
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.ignore_missing = false
lvim.builtin.which_key.setup.triggers_blacklist = {
	-- list of mode / prefixes that should never be hooked by WhichKey
	-- this is mostly relevant for key maps that start with a native binding
	-- most people should not need to change this
	n = { "d" },
}

-- Telescope config
lvim.builtin.telescope.defaults.path_display = { truncate = 3, shorten = { len = 3, exclude = { -1, -2, -3 } } }

lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#nvim-comment
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = false
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.treesitter.textobjects = {
	select = {
		enable = true,

		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,

		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
		},
		-- You can choose the select mode (default is charwise 'v')
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
		-- If you set this to `true` (default is `false`) then any textobject is
		-- extended to include preceding xor succeeding whitespace. Succeeding
		-- whitespace has priority in order to act similarly to eg the built-in
		-- `ap`.
		include_surrounding_whitespace = true,
	},
	swap = {
		enable = false,
		swap_next = {
			["<leader>a"] = "@parameter.inner",
		},
		swap_previous = {
			["<leader>A"] = "@parameter.inner",
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]m"] = "@function.outer",
			["]]"] = "@class.outer",
		},
		goto_next_end = {
			["]M"] = "@function.outer",
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},
	lsp_interop = {
		enable = false,
		border = "none",
		peek_definition_code = {
			["<leader>df"] = "@function.outer",
			["<leader>dF"] = "@class.outer",
		},
	},
}

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
---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solidity" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "solidity_ls_nomicfoundation"
end, lvim.lsp.automatic_configuration.skipped_servers)

local null_ls = require "null-ls"

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
	null_ls.builtins.code_actions.eslint,
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

	-- solidity
	null_ls.builtins.formatting.prettier.with {
		filetypes = { "solidity" },
	},
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	null_ls.builtins.diagnostics.eslint,
	-- null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.golangci_lint.with {
		extra_args = { "--fast" },
	},
	-- null_ls.builtins.diagnostics.staticcheck,

	null_ls.builtins.diagnostics.shellcheck,

	null_ls.builtins.diagnostics.zsh,

	-- null_ls.builtins.diagnostics.actionlint, -- GitHub Actions
}

-- TODO: explore cbfmt, markdownlint, commitlint, codespell, editorconfig_checker
-- TODO: https://github.com/jayp0521/mason-null-ls.nvim

-- Additional Plugins
lvim.plugins = {
	-- General
	{ "tpope/vim-repeat" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup {
				-- Configuration here, or leave empty to use defaults
			}
		end,
	},
	-- {"windwp/nvim-autopairs"}, -- NOTE: battery included
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
		dependencies = "nvim-lua/plenary.nvim",
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
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup {}
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("git-worktree").setup {}
			require("telescope").load_extension "git_worktree"
		end,
	},
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	config = function()
	-- 		require("neoscroll").setup {
	-- 			easing_function = "quadratic",
	-- 		}
	-- 	end,
	-- },
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup {
				show = true,
				show_in_active_only = false,
				set_highlights = true,
				folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
				max_lines = false, -- disables if no. of lines in buffer exceeds this
				handle = {
					text = " ",
					color = "#4f4f4f",
					cterm = nil,
					-- highlight = "CursorColumn",
					hide_if_all_visible = false, -- Hides handle if all lines are visible
				},
				marks = {
					Cursor = {
						-- text = "•",
						text = "─",
						priority = 0,
						color = "#7f7f7f",
						cterm = nil,
						-- highlight = "Normal",
					},
					Search = {
						text = { "-", "=" },
						priority = 1,
						color = nil,
						cterm = nil,
						highlight = "Search",
					},
					Error = {
						text = { "-", "=" },
						priority = 2,
						color = nil,
						cterm = nil,
						highlight = "DiagnosticVirtualTextError",
					},
					Warn = {
						text = { "-", "=" },
						priority = 3,
						color = nil,
						cterm = nil,
						highlight = "DiagnosticVirtualTextWarn",
					},
					Info = {
						text = { "-", "=" },
						priority = 4,
						color = nil,
						cterm = nil,
						highlight = "DiagnosticVirtualTextInfo",
					},
					Hint = {
						text = { "-", "=" },
						priority = 5,
						color = nil,
						cterm = nil,
						highlight = "DiagnosticVirtualTextHint",
					},
					Misc = {
						text = { "-", "=" },
						priority = 6,
						color = nil,
						cterm = nil,
						highlight = "Normal",
					},
					GitAdd = {
						text = "┆",
						priority = 7,
						color = nil,
						cterm = nil,
						highlight = "GitSignsAdd",
					},
					GitChange = {
						text = "┆",
						priority = 7,
						color = nil,
						cterm = nil,
						highlight = "GitSignsChange",
					},
					GitDelete = {
						text = "▁",
						priority = 7,
						color = nil,
						cterm = nil,
						highlight = "GitSignsDelete",
					},
				},
				excluded_buftypes = {
					"terminal",
				},
				excluded_filetypes = {
					"prompt",
					"TelescopePrompt",
					"noice",
					"alpha",
					"NvimTree",
					"",
				},
				autocmd = {
					render = {
						"BufWinEnter",
						"TabEnter",
						"TermEnter",
						"WinEnter",
						"CmdwinLeave",
						"TextChanged",
						"VimResized",
						"WinScrolled",
					},
					clear = {
						"BufWinLeave",
						"TabLeave",
						"TermLeave",
						"WinLeave",
					},
				},
				handlers = {
					cursor = true,
					diagnostic = false,
					gitsigns = false, -- Requires gitsigns
					handle = true,
					search = false, -- Requires hlslens
				},
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
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup {
				highlight_on_key = true, -- show highlights only after keypress
				dim = false, -- dim all other characters if set to true (recommended!)
			}
		end,
	},
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
		end,
	},

	-- Git
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
		config = function()
			require("diffview").setup()
		end,
	},
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
		dependencies = "nvim-lua/plenary.nvim",
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
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = function()
			require("neogit").setup {
				disable_commit_confirmation = true,
				integrations = {
					-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
					-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
					--
					-- Requires you to have `sindrets/diffview.nvim` installed.
					-- use {
					--   'TimUntersberger/neogit',
					--   dependencies = {
					--     'nvim-lua/plenary.nvim',
					--     'sindrets/diffview.nvim'
					--   }
					-- }
					--
					diffview = true,
				},
			}
		end,
	},
	{
		"ldelossa/gh.nvim",
		dependencies = { { "ldelossa/litee.nvim" } },
		config = function()
			require("litee.lib").setup()
			require("litee.gh").setup {
				-- deprecated, around for compatability for now.
				jump_mode = "invoking",
				-- remap the arrow keys to resize any litee.nvim windows.
				map_resize_keys = false,
				-- do not map any keys inside any gh.nvim buffers.
				disable_keymaps = false,
				-- the icon set to use.
				icon_set = "default",
				-- any custom icons to use.
				icon_set_custom = nil,
				-- whether to register the @username and #issue_number omnifunc completion
				-- in buffers which start with .git/
				git_buffer_completion = true,
				-- defines keymaps in gh.nvim buffers.
				keymaps = {
					-- when inside a gh.nvim panel, this key will open a node if it has
					-- any futher functionality. for example, hitting <CR> on a commit node
					-- will open the commit's changed files in a new gh.nvim panel.
					open = "<CR>",
					-- when inside a gh.nvim panel, expand a collapsed node
					expand = "zo",
					-- when inside a gh.nvim panel, collpased and expanded node
					collapse = "zc",
					-- when cursor is over a "#1234" formatted issue or PR, open its details
					-- and comments in a new tab.
					goto_issue = "gd",
					-- show any details about a node, typically, this reveals commit messages
					-- and submitted review bodys.
					details = "d",
					-- inside a convo buffer, submit a comment
					submit_comment = "<C-s>",
					-- inside a convo buffer, when your cursor is ontop of a comment, open
					-- up a set of actions that can be performed.
					actions = "<C-a>",
					-- inside a thread convo buffer, resolve the thread.
					resolve_thread = "<C-r>",
					-- inside a gh.nvim panel, if possible, open the node's web URL in your
					-- browser. useful particularily for digging into external failed CI
					-- checks.
					goto_web = "gx",
				},
			}
		end,
	},
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	dependencies = {
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
	-- { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" }, -- NOTE: battery included
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	-- TODO: {"RRethy/nvim-treesitter-textsubjects"},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup {
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
			}
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup {}
			require("telescope").load_extension "refactoring"
		end,
	},

	-- Language Pack
	{ "mfussenegger/nvim-jdtls" },
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			require("dap-vscode-js").setup {
				-- NOTE: https://github.com/mxsdev/nvim-dap-vscode-js/issues/58
				debugger_cmd = { "js-debug-adapter" },
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			}
			for _, language in ipairs { "typescript", "javascript", "svelte" } do
				require("dap").configurations[language] = {
					-- attach to a node process that has been started with
					-- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
					-- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
					{
						-- use nvim-dap-vscode-js's pwa-node debug adapter
						type = "pwa-node",
						-- attach to an already running node process with --inspect flag
						-- default port: 9222
						request = "attach",
						-- allows us to pick the process using a picker
						processId = require("dap.utils").pick_process,
						-- name of the debug action you have to select for this config
						name = "Attach debugger to existing `node --inspect` process",
						-- for compiled languages like TypeScript or Svelte.js
						sourceMaps = true,
						-- resolve source maps in nested locations while ignoring node_modules
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
						-- path to src in vite based projects (and most other projects as well)
						cwd = "${workspaceFolder}/src",
						-- we don't want to debug code inside node_modules, so skip it!
						skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
					},
					-- only if language is javascript, offer this debug action
					language == "javascript"
							and {
								-- use nvim-dap-vscode-js's pwa-node debug adapter
								type = "pwa-node",
								-- launch a new process to attach the debugger to
								request = "launch",
								-- name of the debug action you have to select for this config
								name = "Launch file in new node process",
								-- launch current file
								program = "${file}",
								cwd = "${workspaceFolder}",
							}
						or nil,
				}
			end
		end,
	},
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
	-- {
	-- 	"toppair/peek.nvim",
	-- 	event = { "VeryLazy" },
	-- 	build = "deno task --quiet build:fast",
	-- 	config = function()
	-- 		require("peek").setup()
	-- 		-- refer to `configuration to change defaults`
	-- 		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
	-- 		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	-- 	end,
	-- },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup {
				color_square_width = 2,
			}
			lvim.builtin.cmp.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},

	-- LSP Enhancement
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup {
				suggestion = { enabled = false },
				panel = { enabled = false },
			}
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},
	-- { "folke/trouble.nvim", cmd = "TroubleToggle" },
	-- {
	-- 	"lvimuser/lsp-inlayhints.nvim",
	-- 	config = function()
	-- 		vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = "LspAttach_inlayhints",
	-- 			callback = function(args)
	-- 				if not (args.data and args.data.client_id) then
	-- 					return
	-- 				end

	-- 				local bufnr = args.buf
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				require("lsp-inlayhints").on_attach(client, bufnr)
	-- 			end,
	-- 		})

	-- 		require("lsp-inlayhints").setup {
	-- 			inlay_hints = {
	-- 				parameter_hints = {
	-- 					show = false,
	-- 					-- prefix = "<- ",
	-- 					separator = ", ",
	-- 				},
	-- 				type_hints = {
	-- 					-- type and other hints
	-- 					show = true,
	-- 					prefix = "",
	-- 					separator = ", ",
	-- 					remove_colon_end = false,
	-- 					remove_colon_start = false,
	-- 				},
	-- 				-- separator between types and parameter hints. Note that type hints are
	-- 				-- shown before parameter
	-- 				labels_separator = "  ",
	-- 				-- whether to align to the length of the longest line in the file
	-- 				max_len_align = false,
	-- 				-- padding from the left if max_len_align is true
	-- 				max_len_align_padding = 1,
	-- 				-- whether to align to the extreme right or not
	-- 				right_align = false,
	-- 				-- padding from the right if right_align is true
	-- 				right_align_padding = 7,
	-- 				-- highlight group
	-- 				highlight = "Comment",
	-- 			},
	-- 			debug_mode = false,
	-- 		}
	-- 	end,
	-- },
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{ "stevearc/dressing.nvim" },
	{
		"mizlan/iswap.nvim",
		cmd = { "ISwap", "ISwapWith" },
		config = function()
			require("iswap").setup()
		end,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

			local capabilities = require("lvim.lsp").common_capabilities()

			require("typescript").setup {
				-- disable_commands = false, -- prevent the plugin from creating Vim commands
				debug = false, -- enable debug logging for commands
				go_to_source_definition = {
					fallback = true, -- fall back to standard LSP definition on failure
				},
				server = { -- pass options to lspconfig's setup method
					on_attach = require("lvim.lsp").common_on_attach,
					on_init = require("lvim.lsp").common_on_init,
					capabilities = capabilities,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayEnumMemberValueHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayFunctionParameterTypeHints = false,
								includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
					},
				},
			}

			-- code_actions.setup {
			-- 	require "typescript.extensions.null-ls.code-actions",
			-- }
		end,
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end,
	},
	{ "simrat39/symbols-outline.nvim" },

	-- Colorschemes
	{ "catppuccin/nvim", name = "catppuccin" },
	-- { "LunarVim/Colorschemes" },
	{ "lunarvim/darkplus.nvim" },
	{ "LunarVim/horizon.nvim" },
	-- { "LunarVim/tokyonight.nvim" },
	-- { "folke/tokyonight.nvim" },
	-- { "shaunsingh/oxocarbon.nvim", run = "./install.sh" },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
