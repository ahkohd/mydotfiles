local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<Leader>0", "<Cmd>BufferLast<CR>", opts)

-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

map("n", "<Leader>-", "<Cmd>BufferClose<CR>", opts)
map("n", "<Leader>t", "<Cmd>BufferPin<CR>", opts)

-- Set barbar's options
require("bufferline").setup({
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  -- exclude_ft = { "javascript" },
  -- exclude_name = { "package.json" },

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = {
    -- Configure the base icons on the bufferline.
    buffer_index = false,
    buffer_number = false,
    button = "×",
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = false, icon = " " },
      [vim.diagnostic.severity.WARN] = { enabled = false, icon = " " },
      [vim.diagnostic.severity.INFO] = { enabled = false, icon = " " },
      [vim.diagnostic.severity.HINT] = { enabled = false, icon = " " },
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = { left = "▎", right = "" },

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = { button = "●" },
    pinned = { button = "車", filename = true, separator = { right = "" } },

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = false },
    inactive = { button = "×" },
    visible = { modified = { buffer_number = false } },
  },

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
})
