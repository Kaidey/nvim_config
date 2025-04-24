return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",

        },
        config = function()
            -- ### AUTOCMD ###
            -- Create keybinds on Attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp", { clear = true }),
                callback = function(eventAttach)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = eventAttach.buf, desc = "LSP: " .. desc })
                    end

                    map("lk", vim.lsp.buf.hover, "Hover")
                    map("lrn", vim.lsp.buf.rename, "Rename variable")
                    map("lca", vim.lsp.buf.code_action, "Code Action")
                    map("lgD", vim.lsp.buf.declaration, "Goto Declaration")
                    map("lsh", vim.lsp.buf.signature_help, "Signature Help")
                    map("lgr", require("telescope.builtin").lsp_references, "Goto References")
                    map("lgi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
                    map("lgd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                    map("lgt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
                    map("lds", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
                    map("lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
                end
            })

            -- ### DIAGNOSTICS CONFIG ###
            vim.diagnostic.config {
                severity_sort = true,
                float = { border = "rounded", source = "if_many" },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                } or {},
                virtual_text = {
                    source = "if_many",
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end
                },
            }

            -- ### LSP SERVER CONFIGS ###
            local servers = {
                lua_ls =
                    require("lsp.lua_ls")
                -- yaml
                -- json
                -- html
                -- css
            }

            -- ### LSP Setup ###
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("mason-lspconfig").setup {
                -- make sure the listed LSP servers are installed on setup
                ensure_installed = { "lua_ls" },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local serverConfig = servers[server_name] or {}
                        -- Override blink.cmp capabilities with configured server capabilities. Force uses value from right-most table
                        serverConfig.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
                            serverConfig.capabilities or {})
                        require("lspconfig")[server_name].setup(serverConfig)
                    end
                }
            }
        end
    },
}
