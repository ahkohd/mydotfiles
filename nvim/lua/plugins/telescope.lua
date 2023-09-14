-- luacheck: globals vim

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  name = "telescope",
  keys = {
    { ";f",    "<cmd>lua require('telescope.builtin').find_files()<cr>",         desc = "Find files" },
    { ";r",    "<cmd>lua require('telescope.builtin').live_grep()<cr>",          desc = "Live grep" },
    { ";m",    "<cmd>lua require('telescope.builtin').marks()<cr>",              desc = "Search marks" },
    { ";p",    "<cmd>Telescope neoclip<cr>",                                     desc = "Search jumplist" },
    { ";j",    "<cmd>lua require('telescope.builtin').jumplist()<cr>",           desc = "Search jumplist" },
    { "\\\\",  "<cmd>Telescope buffers<cr>",                                     desc = "Search buffers" },
    { ";;",    "<cmd>Telescope help_tags<cr>",                                   desc = "Help tags" },
    { "<C-p>", "<cmd>lua require('telescope').extensions.project.project()<cr>", desc = "List projects" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.load_extension("project")
    telescope.load_extension("ui-select")
    telescope.load_extension("neoclip")
    telescope.load_extension("harpoon")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          ".git/.*",
          "node_modules/.*",
          "vendor/.*",
          ".next/.*",
          "target/debug/.*",
          "target/release/.*",
          "src-tauri/target/.*",
          "dist/.*",
          "min.*",
        },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
    })
  end,
}
