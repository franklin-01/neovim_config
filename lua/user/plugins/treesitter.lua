local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			-- "markdown",
			-- "markdown_inline",
			"bash",
			-- "python",
			-- "javascript",
			-- "typescript",
			-- "tsx",
			"go",
			-- "rust",
			"c",
			-- "php",
			"sql",
			"yaml",
			"json",
			"html",
			"css",
			-- "asm",
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
