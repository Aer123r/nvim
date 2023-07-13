-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-c


local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- load custom javascript
require('luasnip.loaders.from_vscode').lazy_load { path = { './snippet/typescript' } }

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
  return
end

cmp.setup {
  -- Load snippet support
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        copilot = "[AI]"
      },
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      symbol_map = {
        Copilot = '.',
      },
      before = function (entry, vim_item)
        local line = entry
        local file = io.open('~/.config/nvim/test.lua','w')
        if file then
          file:write(line..'aaa')
          file:close()
        end
        return vim_item
      end
    }),
  },
  -- Completion settings
  completion = {
    completeopt = 'menu,menuone,noselect',
    keyword_length = 1
  },
  window = {
    completion = cmp.config.window.bordered({
      -- set selecte
      winhighlight = "CursorLine:Visual,NormalFloat:FloatBorder,FloatBorder:CmpDocumentationBorder",
      -- winhighlight = "CursorLine:CmpSel,Search:PmenuSel",
      col_offset = -3,
      side_padding = 0,
    }),
    documentation = cmp.config.window.bordered(),
  },
  --Key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- Tab mapping
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- Load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'copilot' }
  },
}
