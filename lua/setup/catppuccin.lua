return {
    setup = function(theme)
        require("catppuccin").setup({
            flavour = theme,
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.20,
            },
            integrations = {
                cmp = true,
                treesitter = true,
                notify = true,
                flash = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "sapphire",
                    colored_indent_levels = true,
                },
                lsp_saga = true,
                markdown = true,
                noice = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                nvim_surround = true,
                treesitter_context = true,
                rainbow_delimiters = true,
                render_markdown = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                which_key = true,
            },
            color_overrides = {
                mocha = {
                    text = "#f2f4f7",
                    base = "#161616",
                    mantle = "#161616",
                    crust = "#161616",
                },
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
