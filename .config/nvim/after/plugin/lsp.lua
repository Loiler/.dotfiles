local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local telescope = require('telescope.builtin')
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

require('mason').setup()

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

local custom_format = function()
    if vim.bo.filetype == "templ" then
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)

        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- Reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    else
        vim.lsp.buf.format()
    end
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = custom_format })

local function configure()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "<leader>rj", custom_format, { buffer = 0 })
  vim.keymap.set("n", "gd", telescope.lsp_definitions, { buffer = 0 })
  vim.keymap.set("n", "gT", telescope.lsp_type_definitions, { buffer = 0 })
  vim.keymap.set("n", "gi", telescope.lsp_implementations, { buffer = 0 })
  vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = 0 })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, { buffer = 0 })

  vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { buffer = 0 })

  vim.keymap.set("n", "<leader>fd", telescope.diagnostics, { buffer = 0 })

  vim.keymap.set("n", "<leader>cj", vim.lsp.codelens.refresh, { buffer = 0 })
  vim.keymap.set("n", "<leader>ck", vim.lsp.codelens.run, { buffer = 0 })
end

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
  settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("/usr/share/nvim/runtime/lua")] = true,
					[vim.fn.expand("/usr/share/nvim/runtime/lua/vim/lsp")] = true,
				},
			},
		},
	},
}

--lspconfig.hls.setup{
--  capabilities = capabilities,
--  on_attach = function()
--    configure()
--  end,
--  filetypes = { 'haskell', 'lhaskell', 'cabal' },
--  settings = {
--    haskell = {
--      formattingProvider = "fourmolu",
--      checkProject = true,
--    },
--  },
--}

lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

lspconfig.eslint.setup{}

lspconfig.pyright.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

lspconfig.clangd.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

lspconfig.gopls.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

lspconfig.templ.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

--lspconfig.rust_analyzer.setup{
--  capabilities = capabilities,
--  on_attach = function()
--    configure()
--  end,
--  settings = {
--    ["rust-analyzer"] = {
--      checkOnSave = {
--        command = "clippy"
--      }
--    }
--  },
--}

lspconfig.bashls.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
}

lspconfig.tailwindcss.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
  filetypes = { "html", "templ" },
}

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
  filetypes = { "html", "templ" },
})

lspconfig.htmx.setup{
  capabilities = capabilities,
  on_attach = function()
    configure()
  end,
  filetypes = { "html", "templ" },
}

--configs.lf = {
--  default_config = {
--    cmd = { 'ride', '-i', 'language-server' },
--    --cmd = { '/home/loib_st/dev/ride-cli/dist-newstyle/build/x86_64-linux/ghc-9.2.8/ride-cli-1.1.2/x/ride/noopt/build/ride/ride', '-i', 'language-server', '--lib=/home/loib_st/dev/ride-cli/lib/ride-cli' },
--    --cmd = { '/home/loib_st/dev/lf-language-server/dist-newstyle/build/x86_64-linux/ghc-9.2.8/lf-language-server-1.0.0/x/lf-language-server/noopt/build/lf-language-server/lf-language-server', '/home/loib_st/dev/ride-cli/lib/ride-cli/lua/bin/lua-language-server' },
--    filetypes = { 'lf' },
--    root_dir = function(fname)
--      return util.root_pattern(unpack({'Makefile'}))(fname) or util.find_git_ancestor(fname)
--    end,
--    single_file_support = true,
--    capabilities = capabilities,
--    on_attach = function()
--      configure()
--    end,
--  },
--}
--
--lspconfig.lf.setup {}
