local M = {}

function M.setup()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
        modules = {},
        sync_install = true,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "python",
            "query",
            "css",
            "yaml",
            "html",
            "rust",
            "vimdoc",
            "vim",
            "bash",
            "r",
            "markdown",
            "markdown_inline",
            "rnoweb",
            "latex",
            "regex",
            "scheme",
            "sql",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["a="] = "@assignment.outer",
                    ["i="] = "@assignment.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]n"] = "@function.inner",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]N"] = "@function.inner",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[n"] = "@function.inner",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[N"] = "@function.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
    })
end

return M
