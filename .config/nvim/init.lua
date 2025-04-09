-- Gabor Imolai's Neovim:init.lua
-- Based on Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-rc/main/.vimrc
-- Get: https://raw.githubusercontent.com/Imolai/dot-rc/main/.config/nvim/init.lua

-- Disable Perl provider
vim.g.loaded_perl_provider = 0

-- Disable Ruby provider
vim.g.loaded_ruby_provider = 0

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Setup
require("lazy").setup({
  -- File Explorer
  { "nvim-neo-tree/neo-tree.nvim" },

  -- Fuzzy Finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Code Outline
  { "simrat39/symbols-outline.nvim" },

  -- Status Line
  { "nvim-lualine/lualine.nvim" },

  -- Git Integration
  { "lewis6991/gitsigns.nvim" },

  -- Linting & Formatting
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Surround Text
  { "kylechui/nvim-surround" },

  -- Advanced Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP config (language servers)
  { "neovim/nvim-lspconfig" },

  -- Autocompletion plugins
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Debugging (DAP)
  { "mfussenegger/nvim-dap" },
})

-- LSP Config
require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").jdtls.setup({})

-- General Settings
vim.opt.compatible = false
vim.opt.paste = false

-- 2 moving around, searching and patterns
vim.opt.incsearch = true

-- 4 displaying text
vim.opt.list = true
vim.opt.listchars = { tab = ">-", space = "˙", eol = "$" }
vim.opt.number = true
vim.opt.numberwidth = 5

-- 5 syntax, highlighting and spelling
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "+1"

-- 6 multiple windows
vim.opt.hidden = false
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 8 terminal
vim.opt.title = true
vim.opt.titleold = "bash"

-- 9 using the mouse
vim.opt.mouse = "a"

-- 10 printing
-- Invalid option (not found): 'printoptions'
-- vim.opt.printoptions = "paper:A4"

-- 11 messages and info
vim.opt.showcmd = true
vim.opt.ruler = true

-- 13 editing text
vim.opt.undolevels = 99999
vim.opt.textwidth = 100
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.showmatch = true
vim.opt.matchpairs = "(:),{:},[:],<:>"

-- 14 tabs and indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true

-- 15 folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

-- 18 reading and writing files
vim.opt.backup = false
vim.opt.writebackup = false

-- 19 the swap file
vim.opt.swapfile = false

-- 24 multi-byte characters
vim.opt.encoding = "utf-8"

-- 26 misc
vim.scriptencoding = "utf-8"
vim.opt.clipboard = "unnamed"

-- Key mappings for plugins
vim.api.nvim_set_keymap("n", "<F7>", ":NeoTreeFocusToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F8>", ":SymbolsOutline<CR>", { noremap = true, silent = true })

-- LSP-based linting and formatting with null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.pylint.with({
      extra_args = { "--rcfile", vim.fn.expand("$HOME/.pylintrc") },
    }),
    null_ls.builtins.diagnostics.pycodestyle.with({
      extra_args = { "--config", vim.fn.expand("$HOME/setup.cfg") },
    }),
    null_ls.builtins.formatting.black.with({
      extra_args = { "-t", "py39", "-l", "100" },
    }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.shellcheck.with({
      extra_args = { "-x", "-e", "SC1117" },
    }),
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "100", "-ci" },
    }),
  },
})

-- Lualine configuration
require("lualine").setup({
  options = {
    theme = "auto",
  },
})

-- Git signs configuration
require("gitsigns").setup()

-- nvim-surround configuration
require("nvim-surround").setup()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  -- ensure_installed = "all", -- Install all supported languages
  ensure_installed = { "awk", "bash", "c", "cmake", "cpp", "diff", "dockerfile", "doxygen", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "groovy", "java", "json", "lua", "luadoc", "make", "markdown", "markdown_inline", "python", "rst", "toml", "xml", "yaml" },
  highlight = {
    enable = true,
  },
  indent = { enable = true }, -- Automatic indentation
})
