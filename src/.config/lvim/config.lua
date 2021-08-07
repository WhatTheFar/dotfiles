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

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
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

	-- Treesitter
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	{ "p00f/nvim-ts-rainbow" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

	-- Colorschemes
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
