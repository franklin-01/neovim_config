local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    lazy = false
}

function M.config()
	require("nvim-treesitter").setup({
		ensure_installed = {
			"lua",
			"bash",
			"python",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"tsx",
			"go",
			"c",
			"sql",
			"yaml",
			"json",
			"html",
			"css",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		indent = { enable = false },
		auto_install = false,
		sync_install = true,
	})
end

return M
