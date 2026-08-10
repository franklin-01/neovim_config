return {
    cmd = function(dispatchers, _)
        local cmd = 'vscode-html-language-server'
        return vim.lsp.rpc.start({ cmd, '--stdio' }, dispatchers)
    end,
    filetypes = {
        "html",
        "gohtml",
        "gotmpl",
        "templ",
    },

    init_options = {
        configurationSection = { "html", "css", "javascript" },

        embeddedLanguages = {
            css = true,
            javascript = true,
        },

        provideFormatter = true,
    },

    settings = {
        html = {
            format = {
                wrapLineLength = 120,
                wrapAttributes = "auto",
                indentInnerHtml = true,
                preserveNewLines = true,
                maxPreserveNewLines = 2,
                endWithNewline = false,
            },

            hover = {
                documentation = true,
                references = true,
            },

            suggest = {
                html5 = true,
            },

            validate = {
                scripts = true,
                styles = true,
            },

            autoClosingTags = true,
            autoCreateQuotes = true,
            autoClosingBrackets = true,
        },
    },
}
