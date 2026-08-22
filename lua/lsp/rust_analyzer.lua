return {
    pattern = "rust",
    settings = {
        ["rust-analyzer"] = {
           check = {
            ignore = {
                "dead_code"
                },
            },
        },
    },
}
