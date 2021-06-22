
---- HELPERS ----
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts) 
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


---- PLUGINS ----
cmd 'packadd packer.nvim'              -- load the package manager
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

	use 'machakann/vim-sandwich'
	use 'jiangmiao/auto-pairs'
  use 'ap/vim-css-color'
  use 'sheerun/vim-polyglot'           -- language pack
  use 'matze/vim-move'                 -- move code blocks
  use 'vim-airline/vim-airline'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'tpope/vim-commentary'           -- commenting
  use 'sbdchd/neoformat'               -- code formatting

  -- filesystem and navigation
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'christoomey/vim-tmux-navigator'
  use 'junegunn/fzf.vim'
  use 'jremmen/vim-ripgrep'
  use 'jistr/vim-nerdtree-tabs'
  use 'szw/vim-maximizer'
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    }
  }

  -- autosave
  use '907th/vim-auto-save'

  -- development
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'f-person/git-blame.nvim'

  -- color schemes
  use 'NLKNguyen/papercolor-theme'

end)

require('plugins')

---- OPTIONS ----

opt.errorbells = true       -- turn on error bells
opt.visualbell = true       -- flash screen instead of beeping
opt.mouse = 'a'             -- enable scrolling in floating windows
opt.autoindent = true
opt.tabstop = 2             -- number of visual spaces per TAB
opt.softtabstop = 2         -- number of spaces TAB inserts or removes
opt.shiftwidth = 2          -- number of spaces in indentation
opt.expandtab = true        -- tabs are spaces
opt.number = true           -- show line numbers
opt.relativenumber = true   -- relative line numbers
opt.incsearch = true        -- search as characters are entered
opt.hlsearch = true         -- highlight search matches
opt.termguicolors = true
-- TODO: show invisibles

cmd 'syntax on'               -- enable syntax highlighting
cmd 'colorscheme PaperColor'


---- MAPPINGS ----

-- jk is escape 
map('i', 'jk', '<esc>')

-- move vertically by visual line
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- view scrolling
map('', '<S-d>', '<c-d>')
map('', '<S-u>', '<c-u>')
map('', '<S-e>', '<c-e>')
map('', '<S-y>', '<c-y>')

-- filesystem and navigation
map('', '<C-M-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
map('', '<C-M-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')
map('', '<C-M-b>', '<cmd>lua require(\'telescope.builtin\').file_browser()<CR>')
map('n', '<C-M-e>', ':NERDTreeTabsToggle<CR>')

-- code formatting
map('n', '<M-S-f>', ':Format<CR>')

-- tabs and splits
map('n', '<C-S-Left', 'gT')
map('n', '<C-S-Right', 'gt')




