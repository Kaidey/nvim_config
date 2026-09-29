return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({})

            local ensure_installed = {
                "rust", "lua", "javascript", "typescript",
                "html", "json", "yaml", "powershell",
            }
            require("nvim-treesitter").install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = ensure_installed,
                callback = function()
                    vim.treesitter.start()
                    vim.wo.foldmethod = "expr"
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    vim.o.foldnestmax = 1
                end,
            })
        end,
    }
}
