
local cmd = vim.cmd
local o = vim.o
local fn = vim.fn


local function getListchars()

  -- invisible chars
  local tab = '→\\ '
  local space = '·'
  local nbsp = '␣'
  local trail = '~'
  local eol = '⏎'
  local precedes = '«'
  local extends = '»'

  return 'tab:' .. tab .. ',' ..
         'space:' .. space .. ',' ..
         'nbsp:' .. nbsp .. ',' ..
         'trail:' .. trail .. ',' ..
         'eol:' .. eol .. ',' ..
         'precedes:' .. precedes .. ',' ..
         'extends:' .. extends
end


cmd 'filetype plugin indent on'     -- filetype detection
cmd 'syntax on'                     -- syntax highlighting
cmd 'set shortmess+=c'              -- don't pass messages to |ins-completion-menu|

o.termguicolors = true
o.autoindent = true
o.splitbelow = true                 -- new vertical splits appear below
o.splitright = true                 -- new horizontal splits appear on the right
o.showtabline = 2                   -- always show the tabline
o.showmode = false                  -- hide "-- INSERT --" etc.
o.swapfile = false                  -- do not write any swap files
o.undodir = CACHE_PATH .. '/undo'   -- set undo directory
o.undofile = true                   -- enable persistent undos
o.errorbells = true                 -- turn on error bells
o.visualbell = true                 -- flash screen instead of beeping
o.mouse = 'a'                       -- enable scrolling in floating windows
o.tabstop = 2                       -- number of visual spaces per TAB
o.softtabstop = 2                   -- number of spaces TAB inserts or removes
o.shiftwidth = 2                    -- number of spaces in indentation
o.expandtab = true                  -- tabs are spaces
o.number = true                     -- show line numbers
o.relativenumber = true             -- relative line numbers
o.incsearch = true                  -- search as characters are entered
o.hlsearch = true                   -- highlight search matches
o.autoread = true
o.list = false
o.listchars = getListchars()

if COMPLETION_ENGINE == 'nvim-lsp' then
  o.completeopt = 'menu,menuone,noselect'
end


-- CoC recommended settings
o.encoding = 'utf-8'
o.hidden = true
o.backup = false
o.writebackup = false
o.cmdheight = 2
o.updatetime = 300

if fn.has('nvim-0.5.0' or fn.has('patch-8.1.1564')) then
  o.signcolumn = 'number'
else
  o.signcolumn = 'yes'
end


