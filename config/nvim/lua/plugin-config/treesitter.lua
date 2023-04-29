-- Treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "typescript", "python", "lua", "rust", "cpp" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  }

}


