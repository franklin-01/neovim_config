local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local harpoon = require("harpoon")

	-- REQUIRED
	harpoon:setup()
	-- REQUIRED
	-- Função para mapear a tecla "l" somente na janela do Harpoon2
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "harpoon", -- Assumindo que o buffer do Harpoon2 usa o filetype "harpoon"
		callback = function()
			vim.api.nvim_buf_set_keymap(0, "n", "l", "", {
				noremap = true,
				silent = true,
				callback = function()
					harpoon.ui:select_menu_item()
				end,
			})
		end,
	})
	vim.keymap.set("n", "<leader>m", function()
		harpoon:list():add()
		vim.notify("󱡅  marked file")
	end)
	vim.keymap.set("n", "<TAB>", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end)

	vim.keymap.set("n", "<C-S-h>", function()
		harpoon:list():select(1)
	end)

	-- Toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<C-S-P>", function()
		harpoon:list():prev()
	end)
	vim.keymap.set("n", "<C-S-N>", function()
		harpoon:list():next()
	end)
end

return M
