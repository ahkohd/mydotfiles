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
