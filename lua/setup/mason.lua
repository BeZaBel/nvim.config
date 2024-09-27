local servers = require("setup.lspservers")

return {
    setup = function ()
        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- If a new server is added as default, remember to add its config in
        -- lspconfig.lua
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })

        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = {
                "stylua",
                "pyright",
                "clang-format",
                "markdown-oxide",
                "marksman",
            },
        })
    end
}
