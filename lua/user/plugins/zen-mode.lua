local M = {
	"folke/zen-mode.nvim",
	opts = { window = { width = 0.70 } },
}

function M.config()
	local zen = require("zen-mode")
	local wk = require("which-key")
	local icons = require("user.extra.icons")
	zen.setup({
		window = {
			width = 0.70,
		},
	})

	wk.add({
		{ "<leader>z", "<cmd>ZenMode<CR>", desc = icons.kind.Array .. "zen mode" },
	})
end

return M
