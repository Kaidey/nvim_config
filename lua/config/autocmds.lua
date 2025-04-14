vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set("i", "<C-Space>", "<C-x><C-o>",
            { buffer = args.buf, noremap = true, desc = "Trigger autocomplete" })
        vim.keymap.set("n", "<leader>jd", "<C-]>",
            { buffer = args.buf, noremap = true, desc = "Jump to definition" })
        vim.keymap.set("n", "<leader>js", "<C-W>]",
            { buffer = args.buf, noremap = true, desc = "Jump to tag with split" })
        vim.keymap.set("n", "ff", function()
                vim.cmd("normal gg")      -- Move cursor to first line
                vim.cmd("normal V")       -- Enter visual mode
                vim.cmd("normal G")       -- Move cursor to last line
                vim.cmd("normal gq <cr>") -- format with vim.lsp.formatexpr()
            end,
            { desc = "Select entire buffer and format with gq" })
    end
})
