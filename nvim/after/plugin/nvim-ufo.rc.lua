local ftMap = {
  vim = "indent",
  python = { "indent" },
  git = "",
}

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local function applyFoldsAndThenCloseAllFolds(providerName)
    require('async')(function()
        local bufnr = vim.api.nvim_get_current_buf()
        -- make sure buffer is attached
        require('ufo').attach(bufnr)
        -- getFolds return Promise if providerName == 'lsp'
        local ranges = await(require('ufo').getFolds(bufnr, providerName))
        local ok = require('ufo').applyFolds(bufnr, ranges)
        if ok then
            require('ufo').closeAllFolds()
        end
    end)
end

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" ↙%d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

require("ufo").setup({
  fold_virt_text_handler = handler,
  open_fold_hl_timeout = 150,
  close_fold_kinds = { "imports", "comment", "region" },
  preview = {
    win_config = {
      border = { "", "─", "", "", "", "─", "", "" },
      winhighlight = "Normal:Folded",
      winblend = 0,
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      jumpTo = "[",
      jumpBot = "]",
    },
  },
  provider_selector = function(bufnr, filetype, buftype)
    return ftMap[filetype] or {'lsp', 'indent'}
  end,
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   pattern = "*.ts,*.tsx,*.js,*.jsx,*.vue,*.py,*.vim,*.lua,*.css,*.scss,*.rs",
--   callback = function()
--     applyFoldsAndThenCloseAllFolds("lsp")
-- end,
-- })
