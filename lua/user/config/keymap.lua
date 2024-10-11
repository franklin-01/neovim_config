local keymap = vim.keymap.set
local generic_opts_any = { noremap = true, silent = true }
keymap("n", "<Space>", "", generic_opts_any)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- more good move between first and last char on the line
keymap({ "n", "o", "x" }, "<A-h>", "^", generic_opts_any)
keymap({ "n", "o", "x" }, "<A-l>", "g_", generic_opts_any)

-- fix the replacement of what you paste, to the register do not be replaced by what you paste over
keymap("x", "p", [["_dP]], generic_opts_any)

-- center the highlighted word
keymap("n", "n", "nzz", generic_opts_any)
keymap("n", "N", "Nzz", generic_opts_any)
keymap("n", "*", "*zz", generic_opts_any)
keymap("n", "#", "#zz", generic_opts_any)
-- keymap("n", "g", "g*zz", opts)
-- keymap("n", "g#", "g#zz", opts)

local generic_opts = {
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	command_mode = generic_opts_any,
	operator_pending_mode = generic_opts_any,
	term_mode = { silent = true },
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
	operator_pending_mode = "o",
}

local defaults = {
	insert_mode = {
		-- Move current line / block with Alt-j/k ala vscode.
		["<A-j>"] = "<Esc>:m .+1<CR>==gi",
		-- Move current line / block with Alt-j/k ala vscode.
		["<A-k>"] = "<Esc>:m .-2<CR>==gi",
		-- navigation
		["<A-Up>"] = "<C-\\><C-N><C-w>k",
		["<A-Down>"] = "<C-\\><C-N><C-w>j",
		["<A-Left>"] = "<C-\\><C-N><C-w>h",
		["<A-Right>"] = "<C-\\><C-N><C-w>l",
	},

	normal_mode = {
		-- Better window movement
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",

		-- Resize with arrows
		["<C-Up>"] = ":resize -2<CR>",
		["<C-Down>"] = ":resize +2<CR>",
		["<C-Left>"] = ":vertical resize -2<CR>",
		["<C-Right>"] = ":vertical resize +2<CR>",

		-- Move current line / block with Alt-j/k a la vscode.
		["<A-j>"] = ":m .+1<CR>==",
		["<A-k>"] = ":m .-2<CR>==",

		-- QuickFix
		["]q"] = ":cnext<CR>",
		["[q"] = ":cprev<CR>",
		["<C-q>"] = ":call QuickFixToggle()<CR>",

		-- save file
		["<leader>w"] = ":w<CR>",

		["<C-CR>"] = "o",
	},

	term_mode = {
		-- Terminal window navigation
		["<C-h>"] = "<C-\\><C-N><C-w>h",
		["<C-j>"] = "<C-\\><C-N><C-w>j",
		["<C-k>"] = "<C-\\><C-N><C-w>k",
		["<C-l>"] = "<C-\\><C-N><C-w>l",
	},

	visual_mode = {
		-- Better indenting
		["<"] = "<gv",
		[">"] = ">gv",

		-- ["p"] = '"0p',
		-- ["P"] = '"0P',
	},

	visual_block_mode = {
		-- Move current line / block with Alt-j/k ala vscode.
		["<A-j>"] = ":m '>+1<CR>gv-gv",
		["<A-k>"] = ":m '<-2<CR>gv-gv",
	},

	command_mode = {
		-- navigate tab completion with <c-j> and <c-k>
		-- runs conditionally
		["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
		["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
	},
}

for mode, mapping in pairs(defaults) do
	local opt = generic_opts[mode]
	if not opt then
		opt = generic_opts_any
	end

	for key, value in pairs(mapping) do
		if type(value) == "table" then
			keymap(mode_adapters[mode], key, value[1], value[2])
		else
			keymap(mode_adapters[mode], key, value, opt)
		end
	end
end
