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
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      },
    })
  end,
}
