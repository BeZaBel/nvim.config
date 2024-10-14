return {
    setup = function()
        require("conform").setup({
            nortify_on_error = true,
            formaters = {
                mdslw = { prepend_args = { "--stdin-filepath", "$FILENAME" } },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                markdown = { "mdslw" },
            },
            format_on_save = {
                lsp_fallback = true,
                -- async = false,
                timeout_ms = 500,
            },
            log_level = vim.log.levels.DEBUG,
        })
    end,
}
