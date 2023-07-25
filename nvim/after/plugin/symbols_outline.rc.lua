local outline = require("symbols-outline")

outline.setup({
  highlight_hovered_item = false,
  width = 20,
  show_numbers = true,
  show_relative_numbers = true,
  auto_close = false,
  symbols = {
    Function = {
      icon = "",
      hl = "TSFunction",
    },
  },
})
