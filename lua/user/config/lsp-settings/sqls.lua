return {
    on_attach = function(client, _)
        -- disable formatter
        client.server_capabilities.documentFormattingProvider = false
    end,
}
