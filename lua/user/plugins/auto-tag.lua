local M = {
	"windwp/nvim-ts-autotag",
}

function M.config()
	require("nvim-ts-autotag").setup({
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	})
end

return M
