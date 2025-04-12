return {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.opt.updatetime = 100
    end,
    keys = {
        { "<leader>nh", "<cmd>GitGutterNextHunk<cr>", desc = "Jump to next gitgutter hunk" },
        { "<leader>ph", "<cmd>GitGutterPrevHunk<cr>", desc = "Jump to previous gitgutter hunk" },
        { "<leader>vh", "<cmd>GitGutterPreviewHunk<cr>", desc = "Preview hunk" },
        { "<leader>sh", "<cmd>GitGutterStageHunk<cr>", desc = "Stage hunk" },
        { "<leader>uh", "<cmd>GitGutterUndoHunk<cr>", desc = "Undo hunk" },
    }

}
