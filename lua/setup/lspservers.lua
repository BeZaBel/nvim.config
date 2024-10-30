local servers = {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    },
    marksman = {},
    markdown_oxide = {},
    clangd = {
        clangd = {
            filetypes = {
                "c",
                "cpp",
            },
            root_pattern = {
                ".clangd-format",
            },
        },
    },
    r_language_server = {},
    texlab = {
        texlab = {
            build = {
                executable = "latexmk",
                args = {
                    "-pdf",
                    -- "compile",
                    "%f",
                },
                onSave = true,
            },
        },
    },
    ltex = {
        ltex = {
            language = "es",
            enabled = false,
        },
        filetypes = {
            "bib",
            "tex",
        },
    },
    pyright = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
}

return servers
