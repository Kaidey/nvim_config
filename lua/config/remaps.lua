vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dir", vim.cmd.Ex) 
vim.keymap.set("n", "<C-H>", "<C-W>h", {noremap=true}) -- Travel split left 
vim.keymap.set("n", "<C-L>", "<C-W>l", {noremap=true}) -- Travel split right 
vim.keymap.set("n", "<C-K>", "<C-W>k", {noremap=true}) -- Travel split up  
vim.keymap.set("n", "<C-J>", "<C-W>j", {noremap=true}) -- Travel split down
vim.keymap.set("n", "ff", "=ap", {noremap=true}) -- Format buffer
