return require("base.plugin"):new({
    name = "hardline",
    src = "https://github.com/ojroques/nvim-hardline",
    deps = nil,
    config = function(self)
        self.setup {
            bufferline = true,           -- disable bufferline
            bufferline_settings = {
                exclude_terminal = true, -- don't show terminal buffers in bufferline
                show_index = true,       -- show buffer indexes (not the actual buffer numbers) in bufferline
            },
            theme = 'default',           -- change theme
            sections = {
                { class = 'mode', item = require('hardline.parts.mode').get_item() },
                { class = 'high', item = require('hardline.parts.git').get_item(),     hide = 100 },
                { class = 'med',  item = require('hardline.parts.filename').get_item() },
                '%<',
                { class = 'med',     item = '%=' },
                { class = 'low',     item = require('hardline.parts.wordcount').get_item(), hide = 100 },
                { class = 'error',   item = require('hardline.parts.lsp').get_error() },
                { class = 'warning', item = require('hardline.parts.lsp').get_warning() },
                { class = 'warning', item = require('hardline.parts.whitespace').get_item() },
                { class = 'high',    item = require('hardline.parts.filetype').get_item(),  hide = 60 },
                { class = 'mode',    item = require('hardline.parts.line').get_item() },

            },
        }
    end,
    keymaps = {
        { mode = "n", keys = "<Right>", cmd = "<cmd>bnext<CR>" },
        { mode = "n", keys = "<Left>",  cmd = "<cmd>bprev<CR>" },
        { mode = "n", keys = "q",       cmd = "<cmd>bdelete<CR>" },
    }
})
