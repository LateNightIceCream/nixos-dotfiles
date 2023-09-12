local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
    Text = "󰊄",
    Method = "",
    Function = "󰡱",
    Constructor = "",
    Field = "",
    Variable = "󱀍",
    Class = "",
    Interface = "",
    Module = "󰕳",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")

cmp.setup({

  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
  },


  mapping = cmp.mapping.preset.insert({
      -- Use <C-b/f> to scroll the docs
      ['<C-b>'] = cmp.mapping.scroll_docs( -4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- Use <C-k/j> to switch in items
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      -- Use <CR>(Enter) to confirm selection
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),

      -- A super tab
      -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
      ["<Tab>"] = cmp.mapping(function(fallback)
          -- Hint: if the completion menu is visible select next one
          if cmp.visible() then
              cmp.select_next_item()
          elseif has_words_before() then
              cmp.complete()
          else
              fallback()
          end
      end, { "i", "s" }), -- i - insert mode; s - select mode
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
              luasnip.jump( -1)
          else
              fallback()
          end
      end, { "i", "s" }),
  }),


  -- appearance settings
  formatting = {
    fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          path = "[Path]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
        })[entry.source.name]
        return vim_item
      end,
    },


  -- Set source precedence
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- For nvim-lsp
      { name = 'luasnip' },     -- For luasnip user
      { name = 'buffer' },      -- For buffer word completion
      { name = 'path' },        -- For path completion
  })
})


-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities
}
require('lspconfig')['rnix'].setup {
  capabilities = capabilities
}
require('lspconfig')['ccls'].setup {
  capabilities = capabilities
}
