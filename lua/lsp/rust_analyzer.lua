return {
    pattern = "rust",
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = {
                    "unlinked-file"
                },
            },
        },
    },
}
