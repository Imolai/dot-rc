-- Gabor Imolai's Neovim:init.lua
-- Based on Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-vimrc/main/.vimrc

-- Define the path for lazy.nvim
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim exists, clone it if not
if not (vim.uv or vim.loop).fs_stat(lazyPath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazyPath,
  })
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazyPath)

-- Set up lazy.nvim
require("lazy").setup({
  -- LSP
  { "neovim/nvim-lspconfig" },
  -- LSP tools
  -- none-ls.nvim: `null-ls.nvim` reloaded, maintained by the community.
  -- Only the repo name is changed for compatibility concerns.
  -- All the API and future changes will keep in place as-is.
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  -- Which key
  { "folke/which-key.nvim", lazy = true },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },
  -- Codeium
  {
    "Exafunction/codeium.vim",
    tag = "1.6.39",
    -- event = "BufEnter",
  },
})

-- Set up which-key.nvim
require("which-key").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})

-- Set up lspconfig
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = { 'E203', 'E121', 'E123', 'E126', 'E133', 'E226', 'E241', 'E242', 'E704', 'W503', 'W504', 'W505' },
          maxLineLength = 100,
          indent = 4,
        },
        pydocstyle = {
          enabled = true
        },
        pylint = {
          enabled = true
        },
        isort = {
          enabled = true,
        },
      }
    }
  }
})

-- Set up none-ls.nvim
local none_ls = require("null-ls")
none_ls.setup({
  sources = {
    none_ls.builtins.completion.spell,
    require("none-ls-shellcheck.diagnostics"),
    require("none-ls-shellcheck.code_actions"),
  },
})

-- Set up cmp-nvim-lsp
require("cmp_nvim_lsp").setup()

-- Set up nvim-cmp
require("cmp").setup()

-- Set up cmp-nvim-lsp
require("cmp_nvim_lsp").setup()

-- Set up vim.options
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
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
vim.o.titleold = ""
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

-- Set keymaps
vim.keymap.set('i', '<M-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<M-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<M-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

-- Codeium
vim.g.codeium_server_config = {
  portal_url = "https://codingbuddy.onprem.gic.ericsson.se",
  api_url = "https://codingbuddy.onprem.gic.ericsson.se/_route/api_server"
}
