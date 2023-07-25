# My neovim keybindings

I write about my neovim keybindings.

## Keybindings

**Modes**

- n: normal
- h: hydra submode. Read [hydra](https://github.com/anuvyklack/hydra.nvim) docs for more info.
- i: insert mode

### init.vim

- i: <kbd>k</kbd><kbd>k</kbd> exit insert mode
- n: <kbd>Up</kbd> remapped to <kbd>ctrl</kbd><kbd>u</kbd> scroll up half screen
- n: <kbd>PageUp</kbd> remapped to <kbd>ctrl</kbd><kbd>u</kbd> scroll up half screen
- n: <kbd>Down</kbd> remapped to <kbd>ctrl</kbd><kbd>d</kbd> scroll down half screen
- n: <kbd>PageDown</kbd> remapped to <kbd>ctrl</kbd><kbd>d</kbd> scroll down half screen

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

- n: <kbd>;</kbd><kbd>f</kbd> search files (with name, path, extension, regex)
- n: <kbd>;</kbd><kbd>r</kbd> find files with given keyword in their content (live grep)
- n: <kbd>;</kbd><kbd>;</kbd> show commands docs (popover modal)
- n: <kbd>\\</kbd><kbd>\\</kbd> show all buffers (open editors)
- n: <kbd>ctrl</kbd><kbd>o</kbd> open projects popover modal

### Prettier

- n: <kbd>\\</kbd><kbd>f</kbd> format file with prettier

### [BarBar](https://github.com/romgrk/barbar.nvim)

- n: <kbd>\\</kbd><kbd>0-9</kbd> goto tab 0-9 _i.e type <kbd>\\</kbd><kbd>2</kbd>, goto tab 2_
- n: <kbd>\\</kbd><kbd>-</kbd> close current tab
- n: <kbd>\\</kbd><kbd>t</kbd> pin current tab
- h: <kbd>t</kbd><kbd>Right</kbd> goto next tab
- h: <kbd>t</kbd><kbd>Left</kbd> goto prev tab
- h: <kbd>t</kbd><kbd>a</kbd> move tab left
- h: <kbd>t</kbd><kbd>d</kbd> move tab right

### Editors

- h: <kbd>z</kbd><kbd>Left</kbd> goto left editor
- h: <kbd>z</kbd><kbd>Right</kbd> goto right editor
- h: <kbd>z</kbd><kbd>Up</kbd> goto up editor
- h: <kbd>z</kbd><kbd>Down</kbd> goto down editor
- h: <kbd>z</kbd><kbd>a</kbd> reduce active editor width
- h: <kbd>z</kbd><kbd>d</kbd> increase active editor width
- h: <kbd>z</kbd><kbd>w</kbd> increase active editor height
- h: <kbd>z</kbd><kbd>Down</kbd> decrease active editor height

### [NeovimBar](https://github.com/romgrk/barbar.nvim)

- n: <kbd>ctrl</kbd><kbd>b</kbd> toggle file explorer bar

### [Symbols outline](https://github.com/simrat39/symbols-outline.nvim)

- n: <kbd>ctrl</kbd><kbd>s</kbd> toggle symbols outline view

### [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)

- n: <kbd>ctrl</kbd><kbd>\\</kbd> toggle terminal

### LSP

- n: <kbd>g</kbd><kbd>D</kbd> goto declaration
- n: <kbd>g</kbd><kbd>d</kbd> goto definition
- n: <kbd>g</kbd><kbd>i</kbd> goto implementation
- n: <kbd>g</kbd><kbd>r</kbd> goto references
- n: <kbd>g</kbd><kbd>s</kbd> show signature
- n: <kbd>\\</kbd><kbd>.</kbd> show code action (i.e show import fix)
- n: <kbd>Shift</kbd><kbd>K</kbd> show hover popup
- n: <kbd>ctrl</kbd><kbd>j</kbd> show code diagnostic problems popup
- i: <kbd>ctrl</kbd><kbd>space</kbd> show code completion dropdown

## [Neogit](https://github.com/TimUntersberger/neogit)

- n: <kbd>ctrl</kbd><kbd>g</kbd> open neogit

## [Search & replace (Nvim-spectra)](https://github.com/nvim-pack/nvim-spectre)

- n: <kbd>\</kbd><kbd>f</kbd> open search and replace
- n: <kbd>\</kbd><kbd>f</kbd><kbd>w</kbd> search current word

## [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)

See [docs](https://github.com/akinsho/git-conflict.nvim) for usage.

See neogit [docs.](https://github.com/TimUntersberger/neogit)

### [Trouble](https://github.com/folke/trouble.nvim)

- n: <kbd>ctrl</kbd><kbd>k</kbd> toggle, show all diagnostic problems in a bottom panel

### [Surround](https://github.com/ur4ltz/surround.nvim)

Surround text, text selection with a character i.e apostrophe.

See surround [docs.](https://github.com/ur4ltz/surround.nvim)

### [Commentary](https://github.com/tpope/vim-commentary)

comment out line of code or selection of code.

See commentary [docs.](https://github.com/tpope/vim-commentary)

### [Markdown preview](https://github.com/iamcco/markdown-preview.nvim)

In normal mode type `:mark`<kbd>Tab</kbd> to see all markdown preview commands.

See [docs](https://github.com/iamcco/markdown-preview.nvim) for more usage info.

### [Auto save](https://github.com/Pocco81/AutoSave.nvim)

In normal mode type `:as`<kbd>Tab</kbd> to see all auto save commands.

### Browse all keymaps (w/ Telescope)

Press <kbd>F2</kbd> while in normal mode

### Debugger sub mode

Press <kbd>/</kbd><kbd>d</kbd> while in normal mode to open debugger sub mode

### Lazygit

Press <kbd>/</kbd><kbd>h</kbd> while in normal mode toggle lazygit

### Harpoon
;q - Toogle UI
<Leader><tab> - Toggle mark file
<Leader><q-y> - Navigate to file 1-6

See [docs](https://github.com/Pocco81/AutoSave.nvim) for more usage info.
