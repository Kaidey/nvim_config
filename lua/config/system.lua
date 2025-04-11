vim.wo.number = true
vim.o.clipboard = unnamedplus
vim.go.tabstop=4
vim.go.shiftwidth=4
vim.go.expandtab=true

-- (If WSL) Add yanked selection to system clipboard. I believe this overcomes the need for a clipboard provider. Copying from sys clipboard already works with clipboard=unnamedplus
-- Source https://www.reddit.com/r/neovim/comments/vxdjyb/comment/itiyb3p/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
if vim.fn.has('wsl') == 1 then
	vim.api.nvim_create_autocmd('TextYankPost', {
		group = vim.api.nvim_create_augroup('Yank', { clear = true }),
		callback = function()
			vim.fn.system('clip.exe', vim.fn.getreg('"'))
		end,
	})
end
