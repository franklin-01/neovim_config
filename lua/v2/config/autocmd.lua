local M = require "base.module"
function M:load()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = require("v2.languages"),
        callback = function(args)
            -- sem lang explicito: vim.treesitter.start deduz pelo filetype do
            -- proprio args.buf. O codigo antigo passava vim.bo.filetype, que e
            -- o do buffer ATUAL -- nem sempre o mesmo de args.buf.
            -- pcall porque o parser pode ainda estar instalando no primeiro
            -- startup depois de adicionar uma linguagem em v2.languages.
            pcall(vim.treesitter.start, args.buf)
            vim.bo[args.buf].syntax = "on" -- only if additional legacy syntax is needed
        end
    })
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
            -- Check if the startup argument is a directory
            local is_dir = vim.fn.isdirectory(data.file) == 1
            if not is_dir then return end

            -- Change to the directory
            vim.cmd.cd(data.file)

            -- Open NvimTree
            require("nvim-tree.api").tree.open()

            -- Close the first listed buffer if it exists
            local bufs = vim.api.nvim_list_bufs()
            for _, buf in ipairs(bufs) do
                if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
                    vim.api.nvim_buf_delete(buf, { force = true })
                    break
                end
            end
        end,
    })

    vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        callback = function()
            vim.cmd("set formatoptions-=cro")
        end,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = {
            "git",
            "lspinfo",
            "netrw",
            "Jaq",
            "qf",
            "help",
            "man",
            "oil",
            "spectre_panel",
            "lir",
            "DressingSelect",
            "tsplayground",
            "",
        },
        callback = function()
            vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
        end,
    })

    -- vim.api.nvim_create_autocmd({ "WinEnter" }, {
    --     callback = function()
    --         vim.cmd("quit")
    --     end,
    -- })

    vim.api.nvim_create_autocmd({ "VimResized" }, {
        callback = function()
            vim.cmd("tabdo wincmd =")
        end,
    })

    vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        pattern = { "*" },
        callback = function()
            vim.cmd("checktime")
        end,
    })

    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        callback = function()
            vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
        end,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
        end,
    })

    -- keep 'scrolloff' lines below the cursor at the end of the buffer too, where
    -- neovim would otherwise let the cursor walk down to the last screen row
    local ctrl_e = vim.api.nvim_replace_termcodes("<C-e>", true, false, true)
    vim.api.nvim_create_autocmd({ "CursorMoved", "WinScrolled" }, {
        callback = function()
            if vim.fn.win_gettype() ~= "" or vim.bo.buftype ~= "" then
                return
            end
            local off = vim.g.bottom_scrolloff or 0
            local height = vim.api.nvim_win_get_height(0)
            if off <= 0 or height < off * 2 then
                return -- window too short to reserve the margin without pinning the cursor
            end
            local below = height - vim.fn.winline()
            if below < off then
                vim.cmd("normal! " .. (off - below) .. ctrl_e)
            end
        end,
    })

    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        callback = function()
            local status_ok, luasnip = pcall(require, "luasnip")
            if not status_ok then
                return
            end
            if luasnip.expand_or_jumpable() then
                luasnip.unlink_current()
                vim.cmd([[silent! lua require("luasnip").unlink_current()]])
            end
        end,
    })
end

return M
