return {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  config = function()
    local Hydra = require('hydra')
    Hydra({
       name = 'Editor navigation',
       mode = 'n',
       body = 'z',
       heads = {
          { '=', '<C-w>=', { desc = "Resize, equally"} },
          { '<Up>', '<C-w><Up>', { desc = "Move up"} },
          { '<Down>', '<C-w><Down>', { desc = "Move down"} },
          { '<Left>', '<C-w><Left>', { desc = "Move left"} },
          { '<Right>', '<C-w><Right>', { desc = "Move right"} },
          { 'a', '4<C-w><', { desc = "Reduce Width"} },
          { 'd', '4<C-w>>', { desc = "Increase Width"} },
          { 'w', '2<C-w>+', { desc = "Increase Height"} },
          { 's', '2<C-w>-', { desc = "Decrease Height"} },
       }
    })

    Hydra({
      name = 'Tabs navigation',
      mode = 'n',
      body = 't',
      heads = {
        {'<Left>', '<Cmd>bp<CR>', { desc = "Goto Previous tab" } },
        {'<Right>', '<Cmd>bn<CR>', { desc = "Goto Next tab"} },
      }
    })

    -- Git submode
    local gitsigns = require('gitsigns')

    local hint = [[
     _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
     _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full 
     _h_: commit history _o_: open diff view _c_: close diff view
     ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
     ^
     ^ ^              _<Enter>_: Neogit              _q_: exit
    ]]

    Hydra({
       hint = hint,
       config = {
          color = 'pink',
          invoke_on_body = true,
          hint = {
             position = 'bottom',
             border = 'rounded'
          },
          on_enter = function()
             vim.bo.modifiable = false
             gitsigns.toggle_signs(true)
             gitsigns.toggle_linehl(true)
          end,
          on_exit = function()
             gitsigns.toggle_signs(false)
             gitsigns.toggle_linehl(false)
             gitsigns.toggle_deleted(false)
          end
       },
       mode = {'n','x'},
       body = '<leader>g',
       heads = {
          { 'J', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gitsigns.next_hunk() end)
                return '<Ignore>'
             end, { expr = true } },
          { 'K', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gitsigns.prev_hunk() end)
                return '<Ignore>'
             end, { expr = true } },
          { 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
          { 'u', gitsigns.undo_stage_hunk },
          { 'S', gitsigns.stage_buffer },
          { 'p', gitsigns.preview_hunk },
          { 'd', gitsigns.toggle_deleted, { nowait = true } },
          { 'b', gitsigns.blame_line },
          { 'B', function() gitsigns.blame_line{ full = true } end },
          { '/', gitsigns.show, { exit = true } }, -- show the base of the file
          { '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
          { 'q', nil, { exit = true, nowait = true } },
          { 'h', '<Cmd>:DiffviewFileHistory<CR>' },
          { 'o', '<Cmd>:DiffviewOpen<CR>' },
          { 'c', '<Cmd>:DiffviewClose<CR>' },
       }
    })
  end
}
