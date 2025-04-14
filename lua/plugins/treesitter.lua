return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "go", "javascript", "typescript", "html", "json", "yaml", "powershell" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = false,
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        }
    }
}
