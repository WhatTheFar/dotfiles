-- lspsaga.nvim
lvim.builtin.which_key.mappings["c"] = {
	name = "+Lspsaga",
	a = { ":Lspsaga code_action<CR>", "Code Action" },
	k = { ":Lspsaga hover_doc<CR>", "Hover Doc" },
	s = { ":Lspsaga signature_help<CR>", "Signature Help" },
	r = { ":Lspsaga rename<CR>", "Rename" },
	d = { ":Lspsaga preview_definition<CR>", "Preview Definition" },
	l = { ":Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
	c = { ":Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics" },
}
lvim.builtin.which_key.vmappings["c"] = {
	name = "+Lspsaga",
	a = { ":Lspsaga range_code_action<CR>", "Code Action" },
}
lvim.keys.normal_mode["gh"] = { ":Lspsaga lsp_finder<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<C-f>"] = {
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
	{ noremap = true, silent = true },
}
lvim.keys.normal_mode["<C-b>"] = {
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
	{ noremap = true, silent = true },
}
lvim.keys.normal_mode["[e"] = {
	":Lspsaga diagnostic_jump_prev<CR>",
	{ noremap = true, silent = true },
}
lvim.keys.normal_mode["]e"] = {
	":Lspsaga diagnostic_jump_next<CR>",
	{ noremap = true, silent = true },
}

-- Additional Plugins
lvim.plugins = {
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup {
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			}
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "InsertEnter",
		config = function()
			require("lspsaga").init_lsp_saga()
		end,
	},
}
