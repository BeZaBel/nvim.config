return {
    setup = function()
        -- Define colors for indentation {{{
        local highlight = {
            "RainbowRed",
            "RainbowOrange",
            "RainbowYellow",
            "RainbowGreen",
            "RainbowBlue",
            "RainbowCyan",
            "RainbowViolet",
        }
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)
        --}}}

        require("ibl").setup({
            enabled = true,
            indent = {
                highlight = highlight,
                char = "┊",
                smart_indent_cap = true,
                priority = 2,
            },
            scope = {
                enabled = true,
                include = {
                    node_type = {
                        ["*"] = {
                            "argument_list",
                            "arguments",
                            "assignment_statement",
                            "Block",
                            "chunk",
                            "class",
                            "ContainerDecl",
                            "dictionary",
                            "do_block",
                            "do_statement",
                            "element",
                            "except",
                            "FnCallArguments",
                            "for",
                            "for_statement",
                            "function",
                            "function_declaration",
                            "function_definition",
                            "if_statement",
                            "IfExpr",
                            "IfStatement",
                            "import",
                            "InitList",
                            "list_literal",
                            "method",
                            "object",
                            "ParamDeclList",
                            "repeat_statement",
                            "selector",
                            "SwitchExpr",
                            "table",
                            "table_constructor",
                            "try",
                            "tuple",
                            "type",
                            "var",
                            "while",
                            "while_statement",
                            "with",
                        },
                    },
                },
                highlight = highlight,
            },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = true,
            },
        })
    end,
}
