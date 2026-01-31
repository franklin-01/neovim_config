vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "lua",
        "bash",
        "python",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "tsx",
        "go",
        "c",
        "sql",
        "yaml",
        "json",
        "html",
        "css",
    },
    callback = function(args)
        vim.treesitter.start(args.buf, vim.treesitter.language.get_lang(vim.bo.filetype))
        vim.bo[args.buf].syntax = 'on'     -- only if additional legacy syntax is needed
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

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
    callback = function()
        vim.cmd("quit")
    end,
})

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

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
        local status_ok, luasnip = pcall(require, "luasnip")
        if not status_ok then
            return
        end
        if luasnip.expand_or_jumpable() then
            -- ask maintainer for option to make this silent
            luasnip.unlink_current()
            vim.cmd([[silent! lua require("luasnip").unlink_current()]])
        end
    end,
})
