-- dartpad.lua
--
-- Cores oficiais do editor do DartPad (o embed usado na documentacao do
-- dart.dev / flutter.dev), extraidas dos temas de producao:
--
--   dart-lang/dart-pad
--     pkgs/dartpad_ui/web/styles/cm-dartpad-dark.css   -> tema dark
--     pkgs/dartpad_ui/web/styles/cm-dartpad-light.css  -> tema light
--     pkgs/dartpad_ui/lib/primitives/theme.dart        -> chrome/UI (Flutter)
--
-- O DartPad roda CodeMirror 5 com o mode `clike` configurado pra Dart, entao
-- o mapeamento abaixo segue a semantica das classes do CM5 -- nao a de um
-- highlighter moderno. Os dois pontos que mais confundem:
--
--   cm-builtin  -> a lista fixa de tipos do Dart mode:
--                  void bool num int double dynamic var String Null Never
--                  ou seja: TIPOS SAO BRANCOS (#FFFFFF no dark)
--   cm-variable -> qualquer identificador comum, incluindo nomes de funcao
--                  em call sites: VARIAVEIS E FUNCOES SAO AZULADAS (#00D2FA)
--
-- `set background=dark` usa o cm-dartpad-dark; `background=light` usa o light.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "dartpad"

local dark = {
  -- syntax (cm-dartpad-dark.css)
  bg           = "#0E161F", -- .cm-s-darkpad background-color
  fg           = "#FFFFFF", -- .cm-s-darkpad color / cm-operator / cm-def
  builtin      = "#FFFFFF", -- cm-builtin   -> tipos (int, String, void, var)
  comment      = "#909CC3", -- cm-comment
  keyword      = "#50E191", -- cm-keyword / cm-tag
  atom         = "#FF916E", -- cm-atom      -> true, false, null
  variable     = "#00D2FA", -- cm-variable / cm-attribute / cm-header
  variable2    = "#FF916E", -- cm-variable-2

  -- nao existe no DartPad (o mode clike nao distingue parametro de variavel);
  -- derivado de `variable` mais claro e dessaturado, mesma regra que o
  -- claude-dark usa (#0096fa -> #83a8f2) pra separar parametro de funcao.
  params       = "#80CEEF",

  -- argumento generico (o String em List<String>): branco recuado na direcao
  -- do azul-acinzentado da paleta, mesma regra de `params` -- secundario e uma
  -- versao mais palida do principal, nao uma cor nova.
  type_arg     = "#D8DCEA",

  string       = "#FA557D", -- cm-string
  string2      = "#FF00FA", -- cm-string-2
  number       = "#909090", -- cm-number / cm-meta (anotacoes @override)
  qualifier    = "#FF9B00", -- cm-qualifier
  property     = "#FF2D64", -- cm-property / CodeMirror-matchingbracket
  fold         = "#52C09B", -- CodeMirror-foldmarker (rgb(82,192,155))
  non_text     = "#909090", -- CodeMirror-linenumber / scrollbar
  bracket      = "#606060", -- outline do matchingbracket / matchingtag
  bg_visual    = "#23364D", -- CodeMirror-selected

  -- chrome (theme.dart, constantes dark*)
  bg_dark      = "#0C141D", -- darkScaffoldColor
  bg_alt       = "#1C2834", -- darkSurfaceColor / darkPrimaryColor
  bg_highlight = "#2B3B4F", -- darkSurfaceVariantColor
  border       = "#1C2834", -- darkDividerColor
  accent       = "#168afd", -- runButtonColor
  error        = "#F44336", -- Colors.red.shade500
  warning      = "#FFEB3B", -- Colors.yellow.shade500
  info         = "#2196F3", -- Colors.blue.shade500
  issue        = "#616161", -- Colors.grey.shade700

  -- derivados: activeLine do editor ja composto sobre o bg (nvim nao tem alpha)
  cursor_line   = "#0F1A27", -- rgba(32,143,253,.035) sobre #0E161F
  cursor_gutter = "#0F1F2E", -- rgba(32,143,253,.07)  sobre #0E161F
}

local light = {
  -- syntax (cm-dartpad-light.css)
  bg           = "#FFFFFF",
  fg           = "#4a4a4a",
  builtin      = "#4a4a4a", -- cm-builtin  -> tipos (igual ao texto normal)
  comment      = "#5F6368",
  keyword      = "#007a27",
  atom         = "#2f4960",
  variable     = "#0E161F", -- cm-variable -> identificadores/funcoes
  variable2    = "#a54a78",

  -- derivado (ver nota no dark): variable clareado, na direcao azul da
  -- paleta light, sem colidir com atom (#2f4960) nem com accent (#1967D2).
  params       = "#31699E",

  -- ver nota no dark: `builtin` esfriado e clareado, sem virar comentario.
  type_arg     = "#5A6473",

  string       = "#bc0056",
  string2      = "#983ab3",
  number       = "#00786d",
  qualifier    = "#d32923",
  property     = "#a54a78",
  fold         = "#52C09B",
  non_text     = "#d0d0d2",
  bracket      = "#c4c4c4",
  bg_visual    = "#e8e8e8",

  -- chrome (theme.dart, constantes light*)
  bg_dark      = "#ECECF1", -- lightSurfaceVariantColor
  bg_alt       = "#F5F5F7", -- lightSurfaceColor
  bg_highlight = "#ECECF1",
  border       = "#DCE2E8", -- lightDividerColor
  accent       = "#1967D2", -- lightPrimaryColor
  error        = "#EF5350", -- Colors.red.shade400
  warning      = "#FBC02D", -- Colors.yellow.shade700
  info         = "#42A5F5", -- Colors.blue.shade400
  issue        = "#BDBDBD", -- Colors.grey.shade400

  cursor_line   = "#F7FBFF", -- rgba(27,134,245,.035) sobre #fff
  cursor_gutter = "#EFF7FE", -- rgba(27,134,245,.07)  sobre #fff
}

local c = vim.o.background == "light" and light or dark

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- ==========================================================================
-- Editor UI
-- ==========================================================================
hl("Normal",       { fg = c.fg, bg = c.bg })
hl("NormalFloat",  { fg = c.fg, bg = c.bg_alt })
hl("NormalNC",     { fg = c.fg, bg = c.bg })
hl("FloatBorder",  { fg = c.border, bg = c.bg_alt })
hl("FloatTitle",   { fg = c.variable, bg = c.bg_alt, bold = true })
hl("Cursor",       { fg = c.bg, bg = c.fg })
hl("CursorLine",   { bg = c.cursor_line })
hl("CursorColumn", { bg = c.cursor_line })
hl("CursorLineNr", { fg = c.fg, bg = c.cursor_gutter, bold = true })
hl("LineNr",       { fg = c.non_text })
hl("SignColumn",   { fg = c.non_text, bg = c.bg })
hl("ColorColumn",  { bg = c.bg_alt })
hl("Visual",       { bg = c.bg_visual })
hl("VisualNOS",    { bg = c.bg_visual })
hl("Search",       { fg = c.bg, bg = c.qualifier })
hl("IncSearch",    { fg = c.bg, bg = c.accent })
hl("CurSearch",    { fg = c.bg, bg = c.accent })
hl("Substitute",   { fg = c.bg, bg = c.property })
hl("MatchParen",   { fg = c.property, bg = c.bracket, bold = true })
hl("Pmenu",        { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel",     { fg = c.fg, bg = c.bg_highlight, bold = true })
hl("PmenuSbar",    { bg = c.bg_alt })
hl("PmenuThumb",   { bg = c.non_text })
hl("PmenuMatch",   { fg = c.accent, bold = true })
hl("StatusLine",   { fg = c.fg, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.comment, bg = c.bg_dark })
hl("WinSeparator", { fg = c.border })
hl("VertSplit",    { fg = c.border })
hl("TabLine",      { fg = c.comment, bg = c.bg_dark })
hl("TabLineSel",   { fg = c.fg, bg = c.bg_highlight, bold = true })
hl("TabLineFill",  { bg = c.bg_dark })
hl("Title",        { fg = c.variable, bold = true })
hl("Directory",    { fg = c.accent })
hl("ErrorMsg",     { fg = c.error })
hl("WarningMsg",   { fg = c.warning })
hl("MoreMsg",      { fg = c.keyword })
hl("Question",     { fg = c.keyword })
hl("ModeMsg",      { fg = c.fg })
hl("WildMenu",     { fg = c.fg, bg = c.bg_highlight })
hl("Folded",       { fg = c.fold, bg = c.bg_alt })
hl("FoldColumn",   { fg = c.non_text, bg = c.bg })
hl("NonText",      { fg = c.non_text })
hl("Whitespace",   { fg = c.non_text })
hl("SpecialKey",   { fg = c.comment })
hl("EndOfBuffer",  { fg = c.bg })
hl("Conceal",      { fg = c.comment })
hl("QuickFixLine", { bg = c.bg_highlight })
hl("Winbar",       { fg = c.comment, bg = c.bg })
hl("WinbarNC",     { fg = c.non_text, bg = c.bg })

-- Diff
hl("DiffAdd",    { fg = c.keyword,  bg = c.bg_alt })
hl("DiffChange", { fg = c.warning,  bg = c.bg_alt })
hl("DiffDelete", { fg = c.error,    bg = c.bg_alt })
hl("DiffText",   { fg = c.variable, bg = c.bg_highlight })

-- Spelling
hl("SpellBad",   { sp = c.error,    undercurl = true })
hl("SpellCap",   { sp = c.warning,  undercurl = true })
hl("SpellLocal", { sp = c.info,     undercurl = true })
hl("SpellRare",  { sp = c.property, undercurl = true })

-- ==========================================================================
-- Standard syntax groups (fallback para filetypes sem treesitter)
-- ==========================================================================
hl("Comment",        { fg = c.comment, italic = true })
hl("Constant",       { fg = c.variable })
hl("String",         { fg = c.string })
hl("Character",      { fg = c.string })
hl("Number",         { fg = c.number })   -- cm-number: cinza
hl("Boolean",        { fg = c.atom })     -- cm-atom
hl("Float",          { fg = c.number })
hl("Identifier",     { fg = c.variable }) -- cm-variable: azulado
hl("Function",       { fg = c.variable }) -- idem
hl("Statement",      { fg = c.keyword })
hl("Conditional",    { fg = c.keyword })
hl("Repeat",         { fg = c.keyword })
hl("Label",          { fg = c.keyword })
hl("Operator",       { fg = c.fg })       -- cm-operator
hl("Keyword",        { fg = c.keyword })
hl("Exception",      { fg = c.keyword })
hl("PreProc",        { fg = c.qualifier })
hl("Include",        { fg = c.keyword })
hl("Define",         { fg = c.qualifier })
hl("Macro",          { fg = c.qualifier })
hl("PreCondit",      { fg = c.qualifier })
hl("Type",           { fg = c.builtin })  -- cm-builtin: branco
hl("StorageClass",   { fg = c.keyword })
hl("Structure",      { fg = c.builtin })
hl("Typedef",        { fg = c.builtin })
hl("Special",        { fg = c.string2 })
hl("SpecialChar",    { fg = c.string2 })
hl("Tag",            { fg = c.keyword })
hl("Delimiter",      { fg = c.fg })
hl("SpecialComment", { fg = c.comment, bold = true })
hl("Debug",          { fg = c.qualifier })
hl("Underlined",     { underline = true })
hl("Ignore",         { fg = c.comment })
hl("Error",          { fg = c.error, bold = true })
hl("Todo",           { fg = c.qualifier, bold = true })

-- ==========================================================================
-- Treesitter (@capture)
-- ==========================================================================

-- Tipos -> cm-builtin (branco). No DartPad so a lista fixa de primitivos do
-- Dart mode cai aqui; classes do usuario (Container, Widget) sao tokenizadas
-- como cm-variable e ficam azuis. Aqui todos os tipos vao pro branco, que e o
-- comportamento util fora de Dart -- pra ser literal, troque estes quatro
-- grupos por c.variable.
hl("@type",                  { fg = c.builtin })
hl("@type.builtin",          { fg = c.builtin })
hl("@type.definition",       { fg = c.builtin })
hl("@constructor",           { fg = c.builtin })

-- Capturas extras vindas de after/queries/dart/highlights.scm, que quebra
-- `List<String>?` em partes: o tipo externo fica @type (branco), o argumento
-- generico @type.argument e o `?` @type.nullable. Sem aquele arquivo estes
-- dois grupos so nao sao usados -- nada quebra.
hl("@type.argument",         { fg = c.type_arg })
hl("@type.nullable",         { fg = c.atom })      -- mesma cor de `null`/`true`/`false`

-- Identificadores e funcoes -> cm-variable (azulado)
hl("@variable",              { fg = c.variable })
hl("@variable.parameter",    { fg = c.params })
hl("@variable.parameter.builtin", { fg = c.params, italic = true })
hl("@parameter",             { fg = c.params })   -- captura legada
hl("@variable.builtin",      { fg = c.keyword })  -- this/super sao keyword no Dart mode
hl("@function",              { fg = c.variable })
hl("@function.call",         { fg = c.variable })
hl("@function.builtin",      { fg = c.variable })
hl("@function.method",       { fg = c.variable })
hl("@function.method.call",  { fg = c.variable })
hl("@function.macro",        { fg = c.qualifier })
hl("@constant",              { fg = c.variable })
hl("@constant.builtin",      { fg = c.atom })     -- cm-atom: true/false/null
hl("@constant.macro",        { fg = c.qualifier })

-- Membros -> cm-property
hl("@variable.member",       { fg = c.property })
hl("@property",              { fg = c.property })
hl("@field",                 { fg = c.property })

-- Keywords -> cm-keyword
hl("@keyword",               { fg = c.keyword })
hl("@keyword.function",      { fg = c.keyword })
hl("@keyword.operator",      { fg = c.keyword })
hl("@keyword.return",        { fg = c.keyword })
hl("@keyword.import",        { fg = c.keyword })
hl("@keyword.conditional",   { fg = c.keyword })
hl("@keyword.repeat",        { fg = c.keyword })
hl("@keyword.exception",     { fg = c.keyword })
hl("@keyword.coroutine",     { fg = c.keyword })
hl("@keyword.modifier",      { fg = c.keyword })
hl("@label",                 { fg = c.keyword })

-- Literais
hl("@string",                { fg = c.string })
hl("@string.escape",         { fg = c.string2 })  -- cm-string-2
hl("@string.special",        { fg = c.string2 })
hl("@string.regexp",         { fg = c.string2 })
hl("@character",             { fg = c.string })
hl("@character.special",     { fg = c.string2 })
hl("@boolean",               { fg = c.atom })
hl("@number",                { fg = c.number })   -- cm-number: cinza
hl("@number.float",          { fg = c.number })
hl("@float",                 { fg = c.number })

-- Pontuacao e operadores -> cm-operator (mesma cor do texto)
hl("@operator",              { fg = c.fg })
hl("@punctuation.delimiter", { fg = c.fg })
hl("@punctuation.bracket",   { fg = c.fg })
hl("@punctuation.special",   { fg = c.string2 })

-- Comentarios
hl("@comment",               { fg = c.comment, italic = true })
hl("@comment.documentation", { fg = c.comment, italic = true })
hl("@comment.error",         { fg = c.error, bold = true })
hl("@comment.warning",       { fg = c.warning, bold = true })
hl("@comment.todo",          { fg = c.qualifier, bold = true })
hl("@comment.note",          { fg = c.info, bold = true })

-- Anotacoes / namespaces / tags
hl("@attribute",             { fg = c.number })     -- cm-meta: @override, cinza
hl("@module",                { fg = c.qualifier })  -- cm-qualifier
hl("@tag",                   { fg = c.keyword })    -- cm-tag
hl("@tag.attribute",         { fg = c.variable })   -- cm-attribute
hl("@tag.delimiter",         { fg = c.fg })

-- Markup
hl("@markup.heading",       { fg = c.variable, bold = true }) -- cm-header
hl("@markup.strong",        { fg = c.fg, bold = true })
hl("@markup.italic",        { fg = c.fg, italic = true })
hl("@markup.underline",     { underline = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.link",          { fg = c.accent, underline = true })
hl("@markup.link.url",      { fg = c.accent, underline = true })
hl("@markup.raw",           { fg = c.string })
hl("@markup.list",          { fg = c.keyword })
hl("@markup.quote",         { fg = c.comment, italic = true })
hl("@diff.plus",            { fg = c.keyword })
hl("@diff.minus",           { fg = c.error })
hl("@diff.delta",           { fg = c.warning })

-- ==========================================================================
-- LSP semantic tokens / diagnosticos
-- ==========================================================================
hl("DiagnosticError", { fg = c.error })
hl("DiagnosticWarn",  { fg = c.warning })
hl("DiagnosticInfo",  { fg = c.info })
hl("DiagnosticHint",  { fg = c.issue })
hl("DiagnosticOk",    { fg = c.keyword })
hl("DiagnosticUnderlineError", { sp = c.error,   undercurl = true })
hl("DiagnosticUnderlineWarn",  { sp = c.warning, undercurl = true })
hl("DiagnosticUnderlineInfo",  { sp = c.info,    undercurl = true })
hl("DiagnosticUnderlineHint",  { sp = c.issue,   undercurl = true })
hl("LspReferenceText",  { bg = c.bg_highlight })
hl("LspReferenceRead",  { bg = c.bg_highlight })
hl("LspReferenceWrite", { bg = c.bg_visual })
hl("LspInlayHint",      { fg = c.comment, bg = c.bg_alt, italic = true })
hl("LspSignatureActiveParameter", { fg = c.params, bold = true })

-- Semantic tokens sao extmarks por cima do treesitter: sem espelhar aqui, eles
-- sobrescrevem as capturas acima (era isso que deixava tipo/funcao fora da cor).
hl("@lsp.type.variable",      { fg = c.variable })
hl("@lsp.type.parameter",     { fg = c.params })
hl("@lsp.type.property",      { fg = c.property })
hl("@lsp.type.function",      { fg = c.variable })
hl("@lsp.type.method",        { fg = c.variable })
hl("@lsp.type.type",          { fg = c.builtin })
hl("@lsp.type.class",         { fg = c.builtin })
hl("@lsp.type.interface",     { fg = c.builtin })
hl("@lsp.type.enum",          { fg = c.builtin })
hl("@lsp.type.struct",        { fg = c.builtin })
hl("@lsp.type.typeParameter", { fg = c.builtin })
hl("@lsp.type.enumMember",    { fg = c.property })
hl("@lsp.type.namespace",     { fg = c.qualifier })
hl("@lsp.type.keyword",       { fg = c.keyword })
hl("@lsp.type.modifier",      { fg = c.keyword })
hl("@lsp.type.string",        { fg = c.string })
hl("@lsp.type.number",        { fg = c.number })
hl("@lsp.type.operator",      { fg = c.fg })
hl("@lsp.type.boolean",       { fg = c.atom })
hl("@lsp.type.comment",       { fg = c.comment, italic = true })
hl("@lsp.type.annotation",    { fg = c.number })   -- cm-meta
hl("@lsp.type.decorator",     { fg = c.number })
hl("@lsp.typemod.variable.defaultLibrary", { fg = c.atom })
hl("@lsp.typemod.class.defaultLibrary",    { fg = c.builtin })
hl("@lsp.typemod.type.defaultLibrary",     { fg = c.builtin })
hl("@lsp.typemod.function.defaultLibrary", { fg = c.variable })

-- ==========================================================================
-- Plugins populares (defaults minimos)
-- ==========================================================================
hl("GitSignsAdd",    { fg = c.keyword })
hl("GitSignsChange", { fg = c.warning })
hl("GitSignsDelete", { fg = c.error })
hl("TelescopeNormal",       { fg = c.fg, bg = c.bg_alt })
hl("TelescopeBorder",       { fg = c.border, bg = c.bg_alt })
hl("TelescopeSelection",    { bg = c.bg_highlight })
hl("TelescopeMatching",     { fg = c.accent, bold = true })
hl("TelescopePromptTitle",  { fg = c.bg, bg = c.accent, bold = true })
hl("NvimTreeFolderIcon", { fg = c.accent })
hl("NvimTreeRootFolder", { fg = c.variable, bold = true })
hl("NvimTreeGitDirty",   { fg = c.warning })
hl("NvimTreeGitNew",     { fg = c.keyword })
hl("NvimTreeGitDeleted", { fg = c.error })
hl("BlinkCmpMenuSelection", { bg = c.bg_highlight })
hl("BlinkCmpLabelMatch",    { fg = c.accent, bold = true })

-- ==========================================================================
-- Terminal
-- ==========================================================================
if vim.o.background == "light" then
  vim.g.terminal_color_0  = "#4a4a4a"
  vim.g.terminal_color_1  = "#d32923"
  vim.g.terminal_color_2  = "#007a27"
  vim.g.terminal_color_3  = "#FBC02D"
  vim.g.terminal_color_4  = "#1967D2"
  vim.g.terminal_color_5  = "#983ab3"
  vim.g.terminal_color_6  = "#00786d"
  vim.g.terminal_color_7  = "#d0d0d2"
  vim.g.terminal_color_8  = "#5F6368"
  vim.g.terminal_color_9  = "#bc0056"
  vim.g.terminal_color_10 = "#007a27"
  vim.g.terminal_color_11 = "#FBC02D"
  vim.g.terminal_color_12 = "#1967D2"
  vim.g.terminal_color_13 = "#a54a78"
  vim.g.terminal_color_14 = "#00786d"
  vim.g.terminal_color_15 = "#0E161F"
else
  vim.g.terminal_color_0  = "#0C141D"
  vim.g.terminal_color_1  = "#FA557D"
  vim.g.terminal_color_2  = "#50E191"
  vim.g.terminal_color_3  = "#FF9B00"
  vim.g.terminal_color_4  = "#00D2FA"
  vim.g.terminal_color_5  = "#FF00FA"
  vim.g.terminal_color_6  = "#52C09B"
  vim.g.terminal_color_7  = "#909CC3"
  vim.g.terminal_color_8  = "#606060"
  vim.g.terminal_color_9  = "#FF2D64"
  vim.g.terminal_color_10 = "#50E191"
  vim.g.terminal_color_11 = "#FF916E"
  vim.g.terminal_color_12 = "#168afd"
  vim.g.terminal_color_13 = "#FF00FA"
  vim.g.terminal_color_14 = "#00D2FA"
  vim.g.terminal_color_15 = "#FFFFFF"
end
