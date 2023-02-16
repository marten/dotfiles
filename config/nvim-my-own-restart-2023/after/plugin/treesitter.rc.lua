local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = { "ruby" },
  },
  ensure_installed = {
    "tsx",
    "fish",
    "json",
    "yaml",
    "css",
    "html",
    "ruby",
    "lua", -- for vim
    "vim", -- for vim
    "c", -- for vim
    "help" -- for vim
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

