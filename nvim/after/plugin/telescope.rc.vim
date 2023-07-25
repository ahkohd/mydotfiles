if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> ;m <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <silent> ;j <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <silent> ;p <cmd>Telescope neoclip<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local previewers_utils = require('telescope.previewers.utils')

-- telescope.load_extension('projects')
telescope.load_extension("ui-select")
telescope.load_extension("neoclip")
telescope.load_extension("harpoon")

telescope.setup{
  defaults = {
    file_ignore_patterns = { ".git/.*", "node_modules/.*", "vendor/.*", ".next/.*", "target/debug/.*", "target/release/.*", "src-tauri/target/.*", "dist/.*", "min.*"},
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)

EOF
