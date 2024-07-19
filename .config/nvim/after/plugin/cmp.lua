vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<A-l>'] = cmp.mapping({
        i = function()
            if not cmp.visible() then
                cmp.complete()
            else
                print("inserting")
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            end
        end
    }),
    ['<A-L>'] = cmp.mapping({
        i = function()
            if not cmp.visible() then
                cmp.complete()
            else
                print("replacing")
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            end
        end
    }),
    ['<A-e>'] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                fallback()
            end
        end
    }),
    ['<A-j>'] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
    }),
    ['<A-J>'] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                for _=1,5 do
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
            else
                fallback()
            end
        end
    }),
    ['<A-k>'] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
    }),
    ['<A-K>'] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                for _=1,5 do
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                end
            else
                fallback()
            end
        end
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
  experimental = {
    ghost_text = true,
  },
})
