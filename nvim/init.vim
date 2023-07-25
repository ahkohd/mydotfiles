autocmd!

" set script encoding
scriptencoding utf-8

" stop loading config if it's on tiny or small
if !1 | finish | endif

syntax on
set termguicolors
set background=dark
set nocompatible
set number
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=0
set laststatus=2
set scrolloff=10
set expandtab
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*


" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

runtime ./plug.vim
runtime ./maps.vim

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:

" Victor's custom key bindings...
" ------------------------------------------------------------------------
" inoremap kk <Esc>
set nu rnu
nmap <Leader>z <C-w>w
" range_formatting in visual mode
xmap <Leader>f <Plug>(prettier-format)
" formatting in normal mode
nmap <Leader>f <Plug>(prettier-format)
" open code action menu in normal mode
nmap <Leader>. :CodeActionMenu<Enter> 
" toggle nvim treee
nmap <c-b> :NvimTreeToggle<Enter>
nmap <c-s> :SymbolsOutline<Enter>
nmap <c-K> :TroubleToggle<Enter>
nmap <c-G> :Neogit<Enter>
nmap <F2> :Telescope keymaps<Enter>
" Remap vim-smoothie c-d, c-u to pageUp & pageDown 
" nnoremap <Up> <cmd>call smoothie#do("\<C-U>") <CR>
" vnoremap <PageUp> <cmd>call smoothie#do("\<C-U>") <CR>
" nnoremap <Down> <cmd>call smoothie#do("\<C-D>") <CR>
" vnoremap <PageDown> <cmd>call smoothie#do("\<C-D>") <CR>
nnoremap <Up> <C-U>
vnoremap <PageUp> <C-U>
nnoremap <Down> <C-D>
vnoremap <PageDown> <C-D>
" Nvim spectra keybindings....
nnoremap <leader>f <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>fw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>f <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>fp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
" -------------------------------------------------------------------------

" remap escape terminal mode to normal mode
:tnoremap <Esc> <C-\><C-n>

set list!
set listchars=tab:→\ ,trail:·,extends:\#,nbsp:.,eol:↵

let g:disable_lsp_client = v:true

" janko/vim-test and puremourning/vimspector
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction      
let g:test#custom_strategies = {'jest': function('JestStrategy')}
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" disable mouse
" set mouse=

if exists("g:neovide")
  set guifont=Berkeley\ Mono:h20
  set linespace=6
  let g:neovide_background_color = '#1E1E2E'
  let g:neovide_scale_factor = 1
  let g:neovide_cursor_vfx_mode = 'torpedo'
  let g:neovide_cursor_vfx_lifetime = 1.2
  let g:neovide_cursor_vfx_particle_density = 15
endif

" commands alias
" command to get current working file
command! -nargs=0 Cwf execute ':!ls %:p'

" tmux
let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <C-Space> :<C-U>TmuxNavigatePrevious<cr>
