vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------
-- Line numbers
-----------------------------------------
vim.opt.nu = true
vim.opt.relativenumber = true

-----------------------------------------
-- Indentation
-----------------------------------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
-- vim.opt.wrap = false

-----------------------------------------
-- No backups, longer undo history
-----------------------------------------
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-----------------------------------------
-- Search highlighting
-----------------------------------------
vim.opt.hlsearch = false -- No highlight all matches on search
vim.opt.incsearch = true

-----------------------------------------
-- Scroll
-----------------------------------------
vim.opt.scrolloff = 8

-----------------------------------------
-- Host clipboard access
-----------------------------------------
vim.opt.clipboard = unnamedplus

-- (If WSL) Add yanked selection to system clipboard. I believe this overcomes the need for a clipboard provider. Copying from sys clipboard already works with clipboard=unnamedplus
-- Source https://www.reddit.com/r/neovim/comments/vxdjyb/comment/itiyb3p/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- if vim.fn.has('wsl') == 1 then
--    vim.api.nvim_create_autocmd('TextYankPost', {
--        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
--        callback = function()
--            vim.fn.system('clip.exe', vim.fn.getreg('"'))
--        end,
--   })
--   end


-----------------------------------------
-- Vim diagnostics setup
-----------------------------------------
vim.diagnostic.config {
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
    virtual_text = false,
}
-- Make diagnostics showup in a box on hover instead of inline virtual text
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
