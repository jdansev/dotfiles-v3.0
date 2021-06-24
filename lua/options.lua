
local cmd = vim.cmd
local o = vim.o
local fn = vim.fn


cmd 'filetype plugin indent on'  -- enable filetype detection
cmd 'syntax on'                  -- enable syntax highlighting

-- Editor Options
o.termguicolors = true
o.errorbells = true              -- turn on error bells
o.visualbell = true              -- flash screen instead of beeping
o.mouse = 'a'                    -- enable scrolling in floating windows
o.autoindent = true
o.tabstop = 2                    -- number of visual spaces per TAB
o.softtabstop = 2                -- number of spaces TAB inserts or removes
o.shiftwidth = 2                 -- number of spaces in indentation
o.expandtab = true               -- tabs are spaces
o.number = true                  -- show line numbers
o.relativenumber = true          -- relative line numbers
o.incsearch = true               -- search as characters are entered
o.hlsearch = true                -- highlight search matches
o.listchars = 'tab:→\\ ,space:·,nbsp:␣,trail:~,eol:⏎,precedes:«,extends:»' -- eol:¬
o.list = false


-- CoC
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


