return {
    {
        -- Rust development
        "mrcjkb/rustaceanvim",
        version = "^3",
        ft = "rust",
    },
    {
        -- LaTeX wrinting
        "lervag/vimtex",
        ft = "tex",
        config = function()
            require("setup.vimtex").setup()
        end,
    },
    {
        -- Lisp like languages auto parenthesis
        "eraserhd/parinfer-rust",
        build = "cargo build --release",
        ft = {
            "scm",
            "yuck",
        },
    },
    {
        -- R development
        "jalvesaq/nvim-r",
        dependencies = {
            "jalvesaq/cmp-nvim-r",
        },
        ft = "r",
        config = function()
            require("setup.nvim-r").setup()
        end,
    },
}
