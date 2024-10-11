local M = { "APZelos/blamer.nvim" }
function M.config()
	local icons = require("user.extra.icons").ui
	vim.g.blamer_enabled = true
	vim.g.blamer_delay = 500
	vim.g.blamer_prefix = icons.BoldArrowRight .. icons.BoldArrowRight .. icons.BoldArrowRight
end
return M
