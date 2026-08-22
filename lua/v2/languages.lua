--[[
    package: v2.languages
    description: filetypes com treesitter ligado -- fonte unica de verdade

    Dois lugares consomem esta lista e precisam concordar:

      v2.plugin.plugins.treesitter -> instala o parser de cada um
      v2.config.autocmd            -> chama vim.treesitter.start() neles

    Antes eram duas listas escritas a mao e elas divergiram em silencio: a de
    instalacao pedia `python`, `javascriptreact` e `typescriptreact`, que nunca
    chegaram a ser instalados, e `dart` nao estava em nenhuma das duas.

    Sao FILETYPES, nao nomes de parser -- quem traduz e
    vim.treesitter.language.get_lang(). Os dois nem sempre batem:
    javascriptreact -> javascript, typescriptreact -> tsx. Por isso os
    filetypes derivados nao precisam de entrada propria na instalacao; o
    parser deles ja entra por javascript/tsx.

    NAO adicione `gotmpl` aqui. O parser em si funciona, mas nesta config
    abrir um .gotmpl com treesitter ligado trava o Neovim no startup: o
    filetype tambem dispara o servidor html em v2.config.lsp.servers.html, e
    o binario (vscode-html-language-server) nao esta instalado. Enquanto isso
    nao for resolvido, gotmpl fica sem highlight de treesitter -- que e como
    sempre esteve.
]]
return {
    "lua",
    "bash",
    "python",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "tsx",
    "java",
    "kotlin",
    "swift",
    "go",
    "c",
    "sql",
    "yaml",
    "json",
    "html",
    "css",
    "dart",
}
