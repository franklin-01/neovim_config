return {
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
}
