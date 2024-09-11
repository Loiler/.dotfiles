local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "templ" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.lf = {
  install_info = {
    url = "~/dev-sandbox/tree-sitter-lf", -- local path or git repo
    files = {"src/parser.c", "src/scanner.cc"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}
