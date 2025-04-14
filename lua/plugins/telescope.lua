return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    name = "telescope",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config =
        function()
            require("telescope").setup()

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope git files" })
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope git commits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope git branches" })
        end,
}
