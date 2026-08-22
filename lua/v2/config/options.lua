--[[
    package: options
    description: set base config for neovim
]]

local M = require 'base.module'

function M:load()
    vim.opt.backup = false            -- creates a backup file
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
    vim.opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
    vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
    vim.opt.fileencoding = "utf-8"    -- the encoding written to a file
    vim.opt.hlsearch = true           -- highlight all matches on previous search pattern
    vim.opt.ignorecase = true         -- ignore case in search patterns
    vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
    vim.opt.pumheight = 10            -- pop up menu height
    vim.opt.pumblend = 10
    vim.opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
    vim.opt.showtabline = 1           -- always show tabs
    vim.opt.smartcase = true          -- smart case
    vim.opt.smartindent = true        -- make indenting smarter again
    vim.opt.splitbelow = true         -- force all horizontal splits to go below current window
    vim.opt.splitright = true         -- force all vertical splits to go to the right of current window
    vim.opt.swapfile = false          -- creates a swapfile
    vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
    vim.opt.timeoutlen = 500          -- time to wait for a mapped sequence to complete (in milliseconds)
    vim.opt.undofile = true           -- enable persistent undo
    vim.opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    vim.opt.expandtab = true          -- convert tabs to spaces
    vim.opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
    vim.opt.tabstop = 4               -- insert 2 spaces for a tab
    vim.opt.cursorline = true         -- highlight the current line
    vim.opt.number = true             -- set numbered lines
    vim.opt.laststatus = 3
    vim.opt.showcmd = false
    vim.opt.ruler = false
    vim.opt.relativenumber = false -- set relative numbered lines
    vim.opt.numberwidth = 4        -- set number column width to 2 {default 4}
    vim.opt.signcolumn = "yes"     -- always show the sign column, otherwise it would shift the text each time
    vim.opt.wrap = false           -- display lines as one long line
    vim.opt.scrolloff = 3      -- no margin at the top: the cursor may reach the first screen row
    vim.g.bottom_scrolloff = 10 -- ...but keep 6 lines below the cursor (enforced in config/autocmd.lua)
    vim.opt.sidescrolloff = 8
    vim.opt.title = false
    vim.opt.hidden = true
    vim.opt.fillchars = vim.opt.fillchars + "eob: "
    vim.opt.fillchars:append({
        stl = " ",
    })

    vim.opt.shortmess:append("c")

    vim.cmd("set whichwrap+=<,>,[,],h,l")
    vim.cmd([[set iskeyword+=-]])

    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    vim.g.netrw_banner = 0
    vim.g.netrw_mouse = 2
    vim.o.winborder = "rounded"

    -- Semantic tokens do LSP desenham por cima do treesitter: por padrao
    -- semantic_tokens = 125 vs treesitter = 100. Isso apaga capturas mais
    -- especificas que vem das queries, como o @type.argument/@type.nullable
    -- de after/queries/dart/highlights.scm -- o dartls manda `String` como
    -- token `class` e o argumento generico voltava pra cor de tipo. Abaixo de
    -- 100 o treesitter vence; os semantic tokens seguem valendo onde o
    -- treesitter nao tem captura.
    vim.hl.priorities.semantic_tokens = 95
end

return M
