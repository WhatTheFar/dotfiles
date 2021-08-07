-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

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

-- TODO: User Config for predefined plugins
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
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-speeddating" },
	-- {"tpope/vim-unimpaired"},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	--     {"folke/tokyonight.nvim"}, {
	--         "ray-x/lsp_signature.nvim",
	--         config = function() require"lsp_signature".on_attach() end,
	--         event = "InsertEnter"
	--     }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
