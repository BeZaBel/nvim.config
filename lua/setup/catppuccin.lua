local M = {}

function M.setup()
  require("catppuccin").setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    integrations = {
      cmp = true,
      treesitter = true,
      mini = {
        enabled = true,
        indent_scope_color = "yellow",
      },
      flash = true,
      lsp_saga = true,
      markdown = true,
      mason = true,
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
      rainbow_delimiters = true,
      render_markdown = true,
      snacks = {
        enabled = true,
        indent_scope_color = "yellow",
      },
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      which_key = true,
    },
  })

  vim.cmd.colorscheme("catppuccin")
end

return M
