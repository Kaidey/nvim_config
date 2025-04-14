return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true, -- lazy.nvim's default impl of "config" runs require(<mainModule>).setup(opts) if opts is set or config = true (https://lazy.folke.io/spec#spec-setup)
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = { "lua_ls", "gopls", "golangci_lint_ls" }, -- make sure the listed LSP servers are installed on startup
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup(require(string.format("lsp.%s", server_name))) -- setup each server with respective nvim/lua/lsp/<server_name>.lua
                end
            }
        }
    },
}
