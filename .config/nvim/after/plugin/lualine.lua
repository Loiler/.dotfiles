local lualine = require('lualine')

lualine.setup({
  sections = {
    lualine_c = {
      'lsp_progress',
    }
  }
})
