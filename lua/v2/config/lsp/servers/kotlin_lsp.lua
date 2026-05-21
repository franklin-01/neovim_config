return {
    cmd = { "kotlin-ls", "--stdio" },
    filetypes = { "kotlin" },
    flags = {
        debounce_text_changes = 0,
        allow_incremental_sync = false,
    },

    single_file_support = true,

    capabilities = (function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        caps.textDocument.semanticTokens = nil
        caps.workspace.didChangeWatchedFiles.dynamicRegistration = false
        return caps
    end)(),

    settings = {
        kotlin = {
            indexing = {
                enabled = true,
                exclude = {
                    "**/build/**",
                    "**/.gradle/**",
                    "**/target/**",
                    "**/.idea/**",
                },
            },

            completion = {
                snippets = true,
                autoImport = true,
            },

            diagnostics = {
                enabled = true,
            },
        },
    },

    root_dir = function(bufnr, on_dir)
        -- Strong markers FIRST
        local gradle_markers = {
            'settings.gradle.kts',
            'settings.gradle',
            'build.gradle.kts',
            'build.gradle',
            'gradlew',
        }

        local root = vim.fs.root(bufnr, gradle_markers)

        -- Fallback to git
        if not root then
            root = vim.fs.root(bufnr, { '.git' })
        end

        -- Final fallback
        root = root or vim.fn.getcwd()

        on_dir(root)
    end,

}
