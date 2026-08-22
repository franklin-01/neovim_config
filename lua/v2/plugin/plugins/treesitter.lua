return require("base.plugin"):new({
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    config = function(ts)
        -- Esta versao do nvim-treesitter nao tem mais o setup{} antigo:
        -- ensure_installed, highlight, indent, auto_install e sync_install sao
        -- aceitos e ignorados em silencio (setup() so le install_dir). Instalar
        -- o parser e ligar o highlight viraram passos separados:
        --
        --   instalar  -> aqui
        --   highlight -> autocmd FileType em v2.config.autocmd
        --
        -- Os dois leem v2.languages pra nao divergirem de novo.
        local cfg = require("nvim-treesitter.config")

        local available = {}
        for _, lang in ipairs(cfg.get_available()) do
            available[lang] = true
        end

        local seen, langs = {}, {}
        for _, ft in ipairs(require("v2.languages")) do
            -- neste ponto do startup o mapeamento filetype->parser ainda nao
            -- esta todo registrado, entao get_lang devolve o filetype cru pra
            -- alguns (javascriptreact, typescriptreact). Filtrar pelo que
            -- existe de fato evita o warning "unsupported language"; o parser
            -- que esses filetypes usam (javascript, tsx) ja esta na lista por
            -- conta propria, e em runtime o autocmd resolve o mapeamento certo.
            local lang = vim.treesitter.language.get_lang(ft)
            if lang and available[lang] and not seen[lang] then
                seen[lang] = true
                langs[#langs + 1] = lang
            end
        end

        -- `installed = true` descarta o que ja existe e sobra so o que falta;
        -- sem isso install() recompila a lista inteira a cada startup.
        local missing = cfg.norm_languages(langs, { installed = true, unsupported = true })

        if #missing > 0 then
            ts.install(missing)
        end
    end
})
