local M = {
	"doums/tenaille.nvim",
}

function M.config()
	local tenaille = require("tenaille")
	tenaille.setup({
		-- disable default key mapping
		default_mapping = false,
	})

	local wrap = require("tenaille").wrap

	vim.keymap.set("v", '"', function()
		wrap({ '"', '"' })
	end)
	vim.keymap.set("v", "'", function()
		wrap({ "'", "'" })
	end)
	vim.keymap.set("v", "`", function()
		wrap({ "`", "`" })
	end)
	vim.keymap.set("v", "(", function()
		wrap({ "(", ")" })
	end)
	vim.keymap.set("v", "[", function()
		wrap({ "[", "]" })
	end)
	vim.keymap.set("v", "{", function()
		wrap({ "{", "}" })
	end)
	vim.keymap.set("v", "<", function()
		wrap({ "<", ">" })
	end)
end

return M
