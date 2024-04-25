-- Gabor Imolai's init.lua
-- Based on Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-vimrc/main/.vimrc

-- 1 important
vim.o.pastetoggle = false

-- 2 moving around, searching and patterns
vim.o.incsearch = true

-- 3 tags

-- 4 displaying text
vim.o.list = true
vim.o.listchars = "tab:>-,space:˙,eol:$"
vim.o.number = true
vim.o.numberwidth = 5

-- 5 syntax, highlighting and spelling
vim.o.hlsearch = true
vim.o.cursorline = true
vim.o.colorcolumn = "+1"

-- 6 multiple windows
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true

-- 7 multiple tab pages

-- 8 terminal
vim.o.title = true
vim.o.titleold = "bash"

-- 9 using the mouse
vim.o.mouse = "a"

-- 10 printing
vim.o.printoptions = "paper:A4"

-- 11 messages and info
vim.o.showcmd = true
vim.o.ruler = true

-- 12 selecting text

-- 13 editing text
vim.o.undolevels = 99999
vim.o.textwidth = 100
vim.o.backup = false
vim.o.writebackup = false
vim.o.showmatch = true
vim.o.matchpairs = "(:),{:},[:],<:>"

-- 14 tabs and indenting
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.copyindent = true
vim.o.preserveindent = true

-- 15 folding
vim.o.foldlevel = 99
vim.o.foldmethod = "indent"

-- 16 diff mode

-- 17 mapping

-- 18 reading and writing files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 19 the swap file

-- 20 command line editing

-- 21 executing external commands

-- 22 running make and jumping to errors (quickfix)

-- 23 language specific

-- 24 multi-byte characters
vim.o.encoding = "utf-8"

-- 25 various

-- 26 misc
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.clipboard = "unnamed"
