local M = {
	"brenoprata10/nvim-highlight-colors",
}

function M.config()
	vim.opt.termguicolors = true
	require("nvim-highlight-colors").setup({})
end

return M
