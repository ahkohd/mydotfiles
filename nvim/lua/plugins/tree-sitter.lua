return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    if not vim.g.loaded_nvim_treesitter then
      vim.cmd([[echom "Not loaded treesitter"]])
      return
    end

    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {},
      },
      ensure_installed = {
        "tsx",
        "toml",
        "json",
        "yaml",
        "html",
        "scss",
        "rust"
      },
      autotag = {
        enable = true,
      }
    }
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
