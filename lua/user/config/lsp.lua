local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "folke/neodev.nvim",
        },
    },
}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(false, { bufnr })
    end
end

M.toggle_inlay_hints = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled({ bufnr }),
        { bufnr }
    )
end

function M.common_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.onTypeFormatting = {
        dynamicRegistration = true,
    }
    capabilities.workspace.workspaceFolders = true
    return capabilities
end

function M.config()
    local wk = require("which-key")
    wk.add({
        {
            "<leader>la",
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            desc = "Code Action",
        },
        {
            "<leader>lf",
            "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
            desc = "Format",
        },
        {
            "<leader>lh",
            "<cmd>lua require('user.config.lsp').toggle_inlay_hints()<cr>",
            desc = "Hints",
        },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
        {
            "<leader>lj",
            "<cmd>lua vim.diagnostic.goto_next()<cr>",
            desc = "Next Diagnostic",
        },
        {
            "<leader>lk",
            "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            desc = "Prev Diagnostic",
        },
        {
            "<leader>ll",
            "<cmd>lua vim.lsp.codelens.run()<cr>",
            desc = "CodeLens Action",
        },
        {
            "<leader>lq",
            "<cmd>lua vim.diagnostic.setloclist()<cr>",
            desc = "Quickfix",
        },
        {
            "<leader>lr",
            "<cmd>lua vim.lsp.buf.rename()<cr>",
            desc = "Rename",
        },
    })

    local lspconfig = require("lspconfig")
    local icons = require("user.extra.icons")

    local servers = {
        "bashls",
        "vtsls",
        "biome",
        -- "cssls",
        -- "gopls",
        "html",
        "lua_ls",
        -- "pyright",
        "tailwindcss",
        -- "rust_analyzer",
        -- "clangd",
        "sqls",
        "dockerls",
        "docker_compose_language_service",
        "rnix",
        "yamlls",
        "jsonls",
        "intelephense",
    }

    local default_diagnostic_config = {
        signs = {
            active = true,
            values = {
                {
                    name = "DiagnosticSignError",
                    text = icons.diagnostics.Error,
                },
                {
                    name = "DiagnosticSignWarn",
                    text = icons.diagnostics.Warning,
                },
                {
                    name = "DiagnosticSignHint",
                    text = icons.diagnostics.Hint,
                },
                {
                    name = "DiagnosticSignInfo",
                    text = icons.diagnostics.Information,
                },
            },
        },
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    local diag_config = vim.diagnostic.config(default_diagnostic_config)
    if diag_config then
        for _, sign in ipairs(vim.tbl_get(diag_config, "signs", "values") or {}) do
            vim.fn.sign_define(sign.name, {
                texthl = sign.name,
                text = sign.text,
                numhl = sign.name,
            })
        end
    end

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
        local opts = {
            on_attach = M.on_attach,
            capabilities = M.common_capabilities(),
        }

        local require_ok, settings =
            pcall(require, "user.config.lsp-settings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        -- if server == "lua_ls" then require("neodev").setup({}) end
    if not (server == "vtsls")  then
      lspconfig[server].setup(opts)
    end

    end

    -- manual config
    -- lspconfig.ts_ls.setup({
    --     on_attach = function(client, bufnr)
    --         lsp_keymaps(bufnr)
    --         -- disable formatter
    --         client.server_capabilities.documentFormattingProvider = false
    --     end,
    --     capabilities = M.common_capabilities(),
    -- })

   lspconfig.vtsls.setup({
  -- Anexa capabilities e on_attach se estiver usando nvim-cmp ou keymaps
  -- capabilities = ...,
  -- on_attach = ...,
     on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            -- disable formatter
            -- client.server_capabilities.documentFormattingProvider = false
     end,

      settings = {
        -- Usa o TypeScript do projeto se disponível
        vtsls = {
          autoUseWorkspaceTsdk = true,
          enableExperimentalServer = true,
          experimental = {
            completion = {
              completeFunctionCalls = true, -- adiciona parênteses e argumentos automaticamente
            },
            serverStatusNotification = true,
            tsserver = {
              logVerbosity = "off", -- pode ser 'terse' ou 'verbose' para debug
            },
          },
        },

        typescript = {
          suggest = {
            autoImports = true,
            completeFunctionCalls = true,
          },
          inlayHints = {
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },

        javascript = {
          suggest = {
            autoImports = true,
            completeFunctionCalls = true,
          },
          inlayHints = {
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },

        completions = {
          completeFunctionCalls = true,
        },

        -- Ajuda a lidar melhor com projetos grandes
        implicitProjectConfiguration = {
          checkJs = true,
          experimentalDecorators = true,
        },
      },
    })

    lspconfig.cssls.setup({
        on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            -- disable formatter
            client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = M.common_capabilities(),
    })

    lspconfig.gopls.setup({
        settings = {
            gopls = {
                usePlaceholders = true, -- Adiciona placeholders para parâmetros em snippets.
                analyses = {
                    unusedparams = true, -- Detecta parâmetros não usados.
                    nilness = true, -- Análise de valores `nil`.
                    shadow = true, -- Detecta variáveis que "sombreiam" outras.
                    unusedwrite = true, -- Detecta valores atribuídos que nunca são usados.
                },
                staticcheck = true, -- Ativa verificações estáticas adicionais.
                hints = {
                    assignVariableTypes = true, -- Mostra o tipo ao declarar uma variável.
                    compositeLiteralFields = true, -- Exibe os nomes dos campos em literais compostos.
                    compositeLiteralTypes = true, -- Mostra o tipo de literais compostos.
                    constantValues = true, -- Exibe os valores de constantes.
                    parameterNames = true, -- Mostra os nomes dos parâmetros em chamadas de função.
                    rangeVariableTypes = true, -- Mostra os tipos em loops `range`.
                },
            },
        },
        on_attach = function(_, bufnr)
            lsp_keymaps(bufnr)
            -- Configure o espaçamento de tabulação
            vim.bo[bufnr].tabstop = 4 -- Define o número de espaços para uma tabulação
            vim.bo[bufnr].shiftwidth = 4 -- Define o número de espaços para indentação
            vim.bo[bufnr].expandtab = false -- Use tabs reais (em vez de espaços)
        end,
    })

    lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
            -- Ative a formatação se for suportada pelo clangd
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_buf_set_option(
                    bufnr,
                    "formatexpr",
                    "v:lua.vim.lsp.formatexpr()"
                )
            end

            -- Configure opções de indentação e tabulação
            vim.bo[bufnr].tabstop = 4
            vim.bo[bufnr].shiftwidth = 4
            vim.bo[bufnr].expandtab = false
        end,

        settings = {
            clangd = {
                fallbackFlags = { "-std=c23" }, -- Adicione flags de fallback, se necessário
            },
        },
    })

    lspconfig.sqls.setup({
        on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            -- disable formatter
            client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = M.common_capabilities(),
    })

    lspconfig.pyright.setup({
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic", -- Ou "strict" para verificações mais rigorosas
                    diagnosticMode = "workspace", -- Ou "openFilesOnly" para analisar apenas arquivos abertos
                    useLibraryCodeForTypes = true, -- Habilita o uso de código de biblioteca para inferência de tipos
                    autoImportCompletions = true, -- Habilita sugestões automáticas de importação
                    autoSearchPaths = true, -- Habilita a busca automática por caminhos de importação
                    diagnosticSeverityOverrides = {
                        reportMissingImports = "warning", -- Altera a severidade para "warning"
                        reportUnusedImport = "information", -- Altera a severidade para "information"
                    },
                },
                pythonPath = vim.fn.getcwd() .. "/venv/bin/python",
            },
        },
        on_attach = function(_, bufnr) lsp_keymaps(bufnr) end,
        capabilities = M.common_capabilities(),
    })
end

return M
