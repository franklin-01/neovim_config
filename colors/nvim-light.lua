-- claude-dark.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "claude-dark"

local c = {
    bg           = "#f3f7f5", -- claro com o mesmo tom esverdeado do original
    fg           = "#2b302e", -- plain identifiers/text
    keyword      = "#b06f00",
    params       = "#2f6fd0",
    ["function"] = "#0068b3",
    type         = "#7a3fd8",
    string       = "#1e7a3a",
    number       = "#c2003c",
    punct        = "#6b6b6b", -- parens, braces, commas, operators

    -- not present in the sampled snippet -- inferred to fit the palette
    comment      = "#8a8a8a",

    -- editor-chrome shades derived from the sampled bg (not sampled themselves)
    bg_dark      = "#e7edea", -- (ver nota abaixo)
    bg_alt       = "#eaf0ed",
    bg_highlight = "#e2e6e4",
    bg_visual    = "#d3dbd8",
    border       = "#c6cecb",
    fg_bright    = "#101413",
    fg_dim       = "#5c625f",
    non_text     = "#b2bab7",
}

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- ==========================================================================
-- Editor UI
-- ==========================================================================
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.bg_highlight })
hl("CursorLineNr", { fg = c.keyword, bold = true })
hl("LineNr", { fg = c.non_text })
hl("SignColumn", { fg = c.non_text, bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("Visual", { bg = c.bg_visual })
hl("VisualNOS", { bg = c.bg_visual })
hl("Search", { fg = c.bg, bg = c.number })
hl("IncSearch", { fg = c.bg, bg = c.keyword })
hl("CurSearch", { fg = c.bg, bg = c.keyword })
hl("Substitute", { fg = c.bg, bg = c.type })
hl("MatchParen", { fg = c.keyword, bold = true, underline = true })
hl("Pmenu", { fg = c.fg_dim, bg = c.bg_alt })
hl("PmenuSel", { fg = c.fg_bright, bg = c.bg_highlight, bold = true })
hl("PmenuSbar", { bg = c.bg_alt })
hl("PmenuThumb", { bg = c.border })
hl("StatusLine", { fg = c.fg_dim, bg = c.bg_dark })
hl("StatusLineNC", { fg = c.comment, bg = c.bg_dark })
hl("WinSeparator", { fg = c.border })
hl("VertSplit", { fg = c.border })
hl("TabLine", { fg = c.comment, bg = c.bg_dark })
hl("TabLineSel", { fg = c.fg_bright, bg = c.bg_highlight, bold = true })
hl("TabLineFill", { bg = c.bg_dark })
hl("Title", { fg = c.keyword, bold = true })
hl("Directory", { fg = c["function"] })
hl("ErrorMsg", { fg = c.number })
hl("WarningMsg", { fg = c.keyword })
hl("MoreMsg", { fg = c.string })
hl("Question", { fg = c.string })
hl("ModeMsg", { fg = c.fg_dim })
hl("WildMenu", { fg = c.fg_bright, bg = c.bg_highlight })
hl("Folded", { fg = c.comment, bg = c.bg_alt, italic = true })
hl("FoldColumn", { fg = c.non_text, bg = c.bg })
hl("NonText", { fg = c.non_text })
hl("Whitespace", { fg = c.non_text })
hl("SpecialKey", { fg = c.comment })
hl("EndOfBuffer", { fg = c.bg })
hl("Conceal", { fg = c.comment })

-- Diff
hl("DiffAdd", { fg = c.string, bg = c.bg_alt })
hl("DiffChange", { fg = c.keyword, bg = c.bg_alt })
hl("DiffDelete", { fg = c.number, bg = c.bg_alt })
hl("DiffText", { fg = c["function"], bg = c.bg_highlight })

-- Spelling
hl("SpellBad", { sp = c.number, undercurl = true })
hl("SpellCap", { sp = c.keyword, undercurl = true })
hl("SpellLocal", { sp = c["function"], undercurl = true })
hl("SpellRare", { sp = c.type, undercurl = true })

-- ==========================================================================
-- Standard syntax groups (fallback for non-treesitter filetypes)
-- ==========================================================================
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.number })
hl("String", { fg = c.string })
hl("Character", { fg = c.string })
hl("Number", { fg = c.number })
hl("Boolean", { fg = c.number, bold = true })
hl("Float", { fg = c.number })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c["function"] })
hl("Statement", { fg = c.keyword })
hl("Conditional", { fg = c.keyword })
hl("Repeat", { fg = c.keyword })
hl("Label", { fg = c.keyword })
hl("Operator", { fg = c.punct })
hl("Keyword", { fg = c.keyword })
hl("Exception", { fg = c.number })
hl("PreProc", { fg = c.type })
hl("Include", { fg = c.keyword })
hl("Define", { fg = c.type })
hl("Macro", { fg = c.type })
hl("PreCondit", { fg = c.type })
hl("Type", { fg = c.type })
hl("StorageClass", { fg = c.keyword })
hl("Structure", { fg = c.type })
hl("Typedef", { fg = c.type })
hl("Special", { fg = c.number })
hl("SpecialChar", { fg = c.number })
hl("Tag", { fg = c.keyword })
hl("Delimiter", { fg = c.punct })
hl("SpecialComment", { fg = c.comment, bold = true })
hl("Debug", { fg = c.number })
hl("Underlined", { underline = true })
hl("Ignore", { fg = c.comment })
hl("Error", { fg = c.number, bold = true })
hl("Todo", { fg = c.keyword, bold = true })

-- ==========================================================================
-- Treesitter (@capture) groups
-- ==========================================================================
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.keyword, italic = true })
hl("@variable.parameter", { fg = c.params })
hl("@variable.member", { fg = c.fg })
hl("@constant", { fg = c.number })
hl("@constant.builtin", { fg = c.number, bold = true })
hl("@constant.macro", { fg = c.type })
hl("@module", { fg = c.fg })
hl("@label", { fg = c.keyword })
hl("@string", { fg = c.string })
hl("@string.escape", { fg = c.number })
hl("@string.special", { fg = c.number })
hl("@string.regexp", { fg = c.number })
hl("@character", { fg = c.string })
hl("@character.special", { fg = c.number })
hl("@boolean", { fg = c.number, bold = true })
hl("@number", { fg = c.number })
hl("@float", { fg = c.number })
hl("@function", { fg = c["function"] })
hl("@function.builtin", { fg = c["function"], italic = true })
hl("@function.macro", { fg = c.type })
hl("@function.method", { fg = c["function"] })
hl("@constructor", { fg = c.type })
hl("@parameter", { fg = c.params })
hl("@keyword", { fg = c.keyword })
hl("@keyword.function", { fg = c.keyword })
hl("@keyword.operator", { fg = c.punct })
hl("@keyword.return", { fg = c.keyword, bold = true })
hl("@keyword.import", { fg = c.keyword })
hl("@keyword.conditional", { fg = c.keyword })
hl("@keyword.repeat", { fg = c.keyword })
hl("@keyword.exception", { fg = c.keyword })
hl("@operator", { fg = c.punct })
hl("@punctuation.delimiter", { fg = c.punct })
hl("@punctuation.bracket", { fg = c.punct })
hl("@punctuation.special", { fg = c.number })
hl("@comment", { fg = c.comment, italic = true })
hl("@comment.documentation", { fg = c.comment, italic = true })
hl("@type", { fg = c.type })
hl("@type.builtin", { fg = c.keyword })
hl("@type.definition", { fg = c.type })
hl("@attribute", { fg = c.type })
hl("@property", { fg = c.fg })
hl("@field", { fg = c.fg })
hl("@tag", { fg = c.keyword })
hl("@tag.attribute", { fg = c.params, italic = true })
hl("@tag.delimiter", { fg = c.punct })
hl("@markup.heading", { fg = c.keyword, bold = true })
hl("@markup.strong", { fg = c.fg_bright, bold = true })
hl("@markup.italic", { fg = c.fg, italic = true })
hl("@markup.underline", { underline = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.link", { fg = c["function"], underline = true })
hl("@markup.link.url", { fg = c["function"], underline = true })
hl("@markup.raw", { fg = c.string })
hl("@markup.list", { fg = c.keyword })
hl("@diff.plus", { fg = c.string })
hl("@diff.minus", { fg = c.number })
hl("@diff.delta", { fg = c.keyword })

-- ==========================================================================
-- LSP semantic tokens / diagnostics
-- ==========================================================================
hl("DiagnosticError", { fg = c.number })
hl("DiagnosticWarn", { fg = c.keyword })
hl("DiagnosticInfo", { fg = c["function"] })
hl("DiagnosticHint", { fg = c.type })
hl("DiagnosticOk", { fg = c.string })
hl("DiagnosticUnderlineError", { sp = c.number, underline = true })
hl("DiagnosticUnderlineWarn", { sp = c.keyword, underline = true })
hl("DiagnosticUnderlineInfo", { sp = c["function"], underline = true })
hl("DiagnosticUnderlineHint", { sp = c.type, underline = true })
hl("LspReferenceText", { bg = c.bg_highlight })
hl("LspReferenceRead", { bg = c.bg_highlight })
hl("LspReferenceWrite", { bg = c.bg_visual })
hl("LspInlayHint", { fg = c.comment, bg = c.bg_alt, italic = true })

-- LSP semantic tokens (@lsp.type.*/@lsp.typemod.*): these are drawn as
-- extmarks on top of Treesitter, so anything the language server tags gets
-- these colors instead of the @-capture ones above unless mirrored here.
-- gopls (and most servers) tag predeclared identifiers -- nil, true, false,
-- iota -- as type "variable" with modifier "defaultLibrary", which is why
-- `nil` was rendering as plain white instead of the sampled pink.
hl("@lsp.type.variable", { fg = c.fg })
hl("@lsp.type.parameter", { fg = c.params })
hl("@lsp.type.property", { fg = c.fg })
hl("@lsp.type.function", { fg = c["function"] })
hl("@lsp.type.method", { fg = c["function"] })
hl("@lsp.type.type", { fg = c.type })
hl("@lsp.type.class", { fg = c.type })
hl("@lsp.type.interface", { fg = c.type })
hl("@lsp.type.enum", { fg = c.type })
hl("@lsp.type.enumMember", { fg = c.number })
hl("@lsp.type.struct", { fg = c.type })
hl("@lsp.type.namespace", { fg = c.punct })
hl("@lsp.type.keyword", { fg = c.keyword })
hl("@lsp.type.string", { fg = c.string })
hl("@lsp.type.number", { fg = c.number })
hl("@lsp.type.comment", { fg = c.comment, italic = true })
hl("@lsp.typemod.variable.defaultLibrary", { fg = c.number })          -- nil, true, false, iota
hl("@lsp.typemod.variable.readonly.defaultLibrary", { fg = c.number })
hl("@lsp.typemod.function.defaultLibrary", { fg = c["function"], italic = true })
hl("@lsp.typemod.type.defaultLibrary", { fg = c.keyword })              -- int, string, error

-- ==========================================================================
-- Popular plugins (minimal, sensible defaults)
-- ==========================================================================
hl("GitSignsAdd", { fg = c.string })
hl("GitSignsChange", { fg = c.keyword })
hl("GitSignsDelete", { fg = c.number })
hl("TelescopeSelection", { bg = c.bg_highlight })
hl("TelescopeBorder", { fg = c.border })
hl("TelescopeMatching", { fg = c.keyword, bold = true })
hl("NvimTreeFolderIcon", { fg = c["function"] })
hl("NvimTreeRootFolder", { fg = c.keyword, bold = true })
