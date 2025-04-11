return {
    "nvim-telescope/telescope.nvim", 
    tag = "0.1.8",
    name = "telescope",
    lazy = false,
    dependencies = { 
        "nvim-lua/plenary.nvim", 
    },
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files"},
        {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep"},
        {"<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Telescope git files"},
        {"<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Telescope git commits"},
        {"<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers"},
    },
}
