local M = {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	opts = {
		-- Enable italic comment
		italic_comments = true,

		-- Underline `@markup.link.*` variants
		underline_links = true,

		-- Disable nvim-tree background color
		disable_nvimtree_bg = false,

		-- Override colors (see ./lua/vscode/colors.lua)
		color_overrides = {
			-- vscLineNumber = '#FFFFFF',
		},
		-- Override highlight groups (see ./lua/vscode/theme.lua)
		group_overrides = {
			-- this supports the same val table as vim.api.nvim_set_hl
			-- use colors from this colorscheme by requiring vscode.colors!
		},
	},
}

function M.config()
	vim.cmd.colorscheme("vscode")
end

return M
