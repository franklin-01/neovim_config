-- https://luals.github.io/wiki/settings/
return {
	settings = {
		Lua = {
			format = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim", "spec", "love" },
			},
			runtime = {
				version = "LuaJIT",
				special = {
					spec = "require",
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					"${3rd}/love2d/library",
				},
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				arrayIndex = "Enable", -- "Enable" | "Auto" | "Disable"
				await = true,
				paramName = "All", -- "All" | "Literal" | "Disable"
				paramType = true,
				semicolon = "All", -- "All" | "SameLine" | "Disable"
				setType = true,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
