return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",

    },
    config = function()
        local blinkcmp_capabilities = require("blink.cmp").get_lsp_capabilities()
        local lang_server_configs = {
            lua_ls = require("lsp.lua_ls"),
            rust_analyzer = require("lsp.rust_analyzer"),
            html = require("lsp.html"),
            cssls = require("lsp.cssls"),
            ts_ls = require("lsp.ts_ls")
        }

        ----------------------------------------------------
        -- Merge default configs with custom configs
        ----------------------------------------------------
        for sv_name, sv_config in pairs(lang_server_configs) do
            local config = vim.lsp.config[sv_name]
            config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {},
                blinkcmp_capabilities or {}, sv_config.capabilities or {})
            config.settings = vim.tbl_deep_extend("force", {}, config.settings or {},
                sv_config.settings or {})
            vim.lsp.config[sv_name] = config
        end

        ----------------------------------------------------
        -- Make sure lsp servers are always installed
        ----------------------------------------------------
        require("mason-lspconfig").setup {
            ensure_installed = vim.tbl_keys(lang_server_configs),
        }


        ----------------------------------------------------
        -- AutoCMD
        ----------------------------------------------------
        vim.api.nvim_create_autocmd("LspAttach",
            {
                group = vim.api.nvim_create_augroup("lsp", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc, })
                    end
                    map("<leader>lk", vim.lsp.buf.hover, "Hover")
                    map("<leader>lrn", vim.lsp.buf.rename, "Rename variable")
                    map("<leader>lca", vim.lsp.buf.code_action, "Code Action")
                    map("<leader>lgD", vim.lsp.buf.declaration, "Goto Declaration")
                    map("<leader>lsh", vim.lsp.buf.signature_help, "Signature Help")
                    map("<leader>lgr", require("telescope.builtin").lsp_references, "Goto References")
                    map("<leader>lgi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
                    map("<leader>lgd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                    map("<leader>lgt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
                    map("<leader>lds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
                    map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
                end,
            })
    end
}
