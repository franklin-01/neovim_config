local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"bash",
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
		auto_install = true,
		sync_install = true,
		ignore_install = {},
		modules = {},
	})
end

return M
