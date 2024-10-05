local formaters = {
    lua = { "stylua" },
    c = { "clang-format" },
    markdown = { "mdslw" },
    rust = { "rustfmt" },
    r = { "styler" },
}

return {
    setup = function()
        require("conform").setup({
            nortify_on_error = true,
            formatters_by_ft = formaters,
            format_on_save = {
                lsp_fallback = true,
                -- async = false,
                timeout_ms = 50,
            },
        })
    end,
}
