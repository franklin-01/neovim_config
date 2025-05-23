-- local M = {}
-- better vscode theme

-- local M = {
--     "Mofiqul/vscode.nvim",
--     priority = 1000,
--     opts = {
--         -- Enable italic comment
--         italic_comments = true,
--
--         -- Underline `@markup.link.*` variants
--         underline_links = true,
--
--         -- Disable nvim-tree background color
--         disable_nvimtree_bg = false,
--
--         -- Override colors (see ./lua/vscode/colors.lua)
--         color_overrides = {
--             -- vscLineNumber = '#FFFFFF',
--         },
--         -- Override highlight groups (see ./lua/vscode/theme.lua)
--         group_overrides = {
--             -- this supports the same val table as vim.api.nvim_set_hl
--             -- use colors from this colorscheme by requiring vscode.colors!
--         },
--     },
-- }

-- local M = {
--     "catppuccin/nvim",
--     priority = 1000, -- Load it before all the other start plugins.
-- }

local M = {
	"sainnhe/gruvbox-material",
	priority = 1000, -- Load it before all the other start plugins.
}

function M.config()
	-- values shown are defaults and will be used if not provided
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_enable_bold = 0
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_disable_italic = 0
	vim.g.gruvbox_material_disable_italic_comment = 0
	vim.g.gruvbox_material_current_word = "high contrast background"
	vim.g.gruvbox_material_better_performance = 1
	-- vim.g.gruvbox_material_foreground = "original"
	vim.cmd.colorscheme("gruvbox-material")
end

-- local M = {
-- 	"bluz71/vim-moonfly-colors",
-- 	name = "moonfly",
-- 	lazy = false,
-- 	priority = 1000, -- Load it before all the other start plugins.
-- }

-- function M.config() vim.cmd("colorscheme gruvbox-material") end

-- function M.config()
--     require("catppuccin").setup({
--         term_colors = true,
--         transparent_background = false,
--         styles = {
--             comments = {},
--             conditionals = {},
--             loops = {},
--             functions = {},
--             keywords = {},
--             strings = {},
--             variables = {},
--             numbers = {},
--             booleans = {},
--             properties = {},
--             types = {},
--         },
--         color_overrides = {
--             mocha = {
--                 base = "#000000",
--                 mantle = "#000000",
--                 crust = "#000000",
--             },
--         },
--     })
--     vim.cmd("colorscheme catppuccin")
-- end
-- local M = {
--     "bluz71/vim-nightfly-colors",
--     name = "nightfly",
--     lazy = false,
--     priority = 1000
-- }
--
-- function M.config()
--     vim.cmd("colorscheme nightfly")
-- end

return M
