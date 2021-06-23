
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

  -- use 'sheerun/vim-polyglot'        -- language pack
	use 'machakann/vim-sandwich'
	use 'jiangmiao/auto-pairs'
  use 'norcalli/nvim-colorizer.lua'    -- color highlighter
  use 'matze/vim-move'                 -- move code blocks
  use 'vim-airline/vim-airline'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'tpope/vim-commentary'           -- commenting
  use 'sbdchd/neoformat'               -- code formatting
  use 'inside/vim-search-pulse'        -- locate cursor after search
  use 'RRethy/vim-illuminate'          -- auto highlights other uses of the cursor word
  use {                                -- indentation guides
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua' 
  }

  -- filesystem and navigation
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'christoomey/vim-tmux-navigator'
  use 'junegunn/fzf.vim'
  use 'jremmen/vim-ripgrep'
  use 'jistr/vim-nerdtree-tabs'
  use 'szw/vim-maximizer'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- autosave
  use '907th/vim-auto-save'

  -- development
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'lewis6991/gitsigns.nvim' }

  -- color schemes
  use 'NLKNguyen/papercolor-theme'

end)


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
map('n', '<C-M-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
map('n', '<C-M-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')
map('n', '<C-M-b>', '<cmd>lua require(\'telescope.builtin\').file_browser()<CR>')
map('n', '<C-M-e>', ':NERDTreeTabsToggle<CR>', { silent = true })

-- code formatting
-- TODO: mapping for code formatting

-- tabs and splits
map('n', '<C-S-Left', 'gT')
map('n', '<C-S-Right', 'gt')


---- LOAD PLUGIN CONFIGS ----
require('plugins')


