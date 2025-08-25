require("user.config.autocmds")
require("user.config.options")
require("user.config.keymap")
require("user.config.plugin-stack")

-- colorscheme
spec("user.config.colorscheme")

-- lsp config
spec("user.config.lsp")
spec("user.plugins.rustoceanvim")

-- plugins
spec("user.plugins.dev-icons")
spec("user.plugins.treesitter")
spec("user.plugins.mason")
--------------------------------
spec("user.plugins.which-key")
--------------------------------
spec("user.plugins.nvim-tree")
spec("user.plugins.telescope")
spec("user.plugins.schemastore")
spec("user.plugins.cmp")
spec("user.plugins.comment")
spec("user.plugins.lua-line")
spec("user.plugins.navic")
spec("user.plugins.breadcrumps")
spec("user.plugins.harpoon")
spec("user.plugins.illuminate")
-- spec("user.plugins.ufo") --BUG DO NOT USE THIS PLUGIN
spec("user.plugins.git-signs")
spec("user.plugins.auto-pairs")
spec("user.plugins.indentline")
spec("user.plugins.toggle-term")
-- spec("user.plugins.fidget")
spec("user.plugins.highlight-colors")
spec("user.plugins.nav-buddy")
spec("user.plugins.project")
spec("user.plugins.zen-mode")
spec("user.plugins.auto-tag")
spec("user.plugins.rainbow-delimiter")
spec("user.plugins.blamer")
spec("user.plugins.tenaille")
spec("user.plugins.noice")
-- spec("user.plugins.love")
spec("user.plugins.go-debugger")
spec("user.plugins.gopher")
-- spec("user.plugins.lsp-lines")


-- extras
spec("user.extra.tabby")

-- initial page
spec("user.extra.alpha")

-- formatters, linters
spec("user.plugins.none-ls")

-- lazy
require("user.config.lazy")
