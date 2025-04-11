return{
    {
        "neovim/nvim-lspconfig",
        init = function()
            require("lspconfig").lua_ls.setup {}
        end
    }
}
