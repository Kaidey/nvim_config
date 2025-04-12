local M = {}

M = {
    filetypes = {"go", "gomod"},
    init_options = {
        command = {"golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1"}
    }
}

return M
