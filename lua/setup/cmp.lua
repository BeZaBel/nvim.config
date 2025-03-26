local M = {}

function M.setup()
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  local cmp = require("cmp")

  luasnip.config.setup({})
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,preview,noselect",
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete({}),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({ select = "false" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = {
      {
        name = "lazydev",
        group_index = 0,
      },
      {
        name = "nvim_lsp",
        option = {
          markdown_oxide = {
            keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
          },
        },
      },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "nvim_lua" },
      { name = "cmp_r" },
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
      },
    },
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = "...",
        before = function(entry, item)
          local menu_icon = {
            nvim_lsp = "",
            vsnip = "",
            path = "",
            cmp_zotcite = "z",
            cmp_r = "R",
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      }),
    },
  })
end

return M
