return {
    setup = function()
        require("conform").setup({
            nortify_on_error = true,
            formaters = {
                mdslw = { prepend_args = { "--stdin-filepath", "$FILENAME" } },
                rprettify = {
                    inherit = false,
                    command = "rprettify",
                    args = { "$FILENAME" },
                    stdin = false,
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                markdown = { "mdslw" },
                rust = { "rustfmt" },
                r = { "rprettify" },
            },
            format_on_save = {
                lsp_fallback = true,
                -- async = false,
                timeout_ms = 500,
            },
        })
    end,
}
