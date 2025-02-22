local M = {
	"nvim-lualine/lualine.nvim",
}

-- add formatter
local function get_active_sources()
	local none_ls = require("null-ls")
	local buf_ft = vim.bo.filetype -- Obtém o tipo de arquivo do buffer atual
	local sources = none_ls.get_sources() -- Obtém todas as fontes registradas
	local active_sources = {}

	-- Filtra as fontes ativas para o tipo de arquivo atual
	for _, source in ipairs(sources) do
		if source.filetypes[buf_ft] then
			table.insert(active_sources, source.name)
		end
	end

	return active_sources
end

local lsp = {
	lsps = function()
		local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
		if #buf_clients == 0 then
			return "LSP Inactive"
		end

		local buf_client_names = {}

		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" and client.name ~= "copilot" then
				table.insert(buf_client_names, client.name)
			end
		end

		local active_sources = get_active_sources()
		vim.list_extend(buf_client_names, active_sources)

		if #buf_client_names == 0 then
			return "LSP Inactive"
		end

		local unique_client_names = table.concat(buf_client_names, ", ")
		local language_servers = string.format("[%s]", unique_client_names)

		return language_servers
	end,
	color = { gui = "bold" },
	cond = function()
		return true
	end,
}
------------------------------------------------

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local icons = require("user.extra.icons")

local diff = {
	"diff",
	source = diff_source,
	symbols = {
		added = icons.git.LineAdded .. " ",
		modified = icons.git.LineModified .. " ",
		removed = icons.git.LineRemoved .. " ",
	},
	padding = { left = 2, right = 10 },
	diff_color = {
		added = { fg = "#98be65" },
		modified = { fg = "#ECBE7B" },
		removed = { fg = "#ec5f67" },
	},
	cond = nil,
}

function M.config()
	require("lualine").setup({
		options = {
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
			component_separators = { left = "", right = "" },
			-- theme = "gruvbox-material",
		},
		sections = {
			lualine_a = { "branch" },
			lualine_b = {
				"filename",
				{
					"filesize",
					cond = function()
						return vim.fn.getfsize(vim.fn.expand("%:p")) > 0
					end,
				},
			},
			lualine_c = { diff, "diagnostics" },
			lualine_x = {
				{
					lsp.lsps,
					cond = function()
						return true
					end,
				},
				"filetype",
				"location",
			},
			lualine_y = {},
			lualine_z = { "progress" },
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
