return {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.opt.updatetime = 100
        vim.keymap.set("n", "<leader>nh", "<cmd>GitGutterNextHunk<cr>", { desc = "Jump to next gitgutter hunk" })
        vim.keymap.set("n", "<leader>ph", "<cmd>GitGutterPrevHunk<cr>", { desc = "Jump to previous gitgutter hunk" })
        vim.keymap.set("n", "<leader>vh", "<cmd>GitGutterPreviewHunk<cr>", { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>sh", "<cmd>GitGutterStageHunk<cr>", { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>uh", "<cmd>GitGutterUndoHunk<cr>", { desc = "Undo hunk" })
    end,
}
