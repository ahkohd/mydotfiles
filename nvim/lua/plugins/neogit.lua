return {
  "NeogitOrg/neogit",
  name =  "neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim"
  },
  keys = {
   { "<C-g>", "<cmd>lua require('neogit').open()<cr>" }
  },
  config = true
}
