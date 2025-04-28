# Install Neovim + LazyVim Installation Guide

*(especially for UBI7 or similar old environments)*

## 1. Install Neovim

Download and install the latest Neovim binary:

Official release:
- https://github.com/neovim/neovim/releases  
  https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
- (unsupported) builds for older glibc: https://github.com/neovim/neovim-releases/releases  
  https://github.com/neovim/neovim-releases/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz

```bash
cd
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
tar xvzf nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 neovim

# Add Neovim to your PATH
echo -e '\nexport PATH="$PATH:$HOME/neovim/bin"\n' >> ~/.bashrc
. ~/.bashrc
```

---

## 2. Use alternative config location (optional)

If you cannot use `~/.config`,  
you can use `~/.rc` instead by setting:

```bash
export XDG_CONFIG_HOME=$HOME/.rc
alias nvim='XDG_CONFIG_HOME=$HOME/.rc nvim'
```

You can add the alias to your `.bashrc` for permanent effect.

---

## 3. Install LazyVim Starter Configuration

If using `~/.config/nvim`:

```bash
# Backup any existing Neovim config
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

If using `~/.rc/nvim`:

```bash
mkdir -p ~/.rc/nvim
git clone https://github.com/LazyVim/starter ~/.rc/nvim
rm -rf ~/.rc/nvim/.git
```

---

## 4. Configure Proxy (if needed)

If you are behind a proxy/firewall:

```bash
export ALL_PROXY="socks5h://127.0.0.1:1080"
```

This ensures plugin download and Mason package manager works.

---

## 5. Start Neovim

```bash
nvim
```

Plugins will be automatically installed by LazyVim.

---

## 6. Basic Custom Configurations

### 6.1 LuaRocks options

#### a. Disable LuaRocks

Create a file:

```bash
~/.rc/nvim/lua/plugins/rocks-disable.lua
```
or
```bash
~/.config/nvim/lua/plugins/rocks-disable.lua
```
depending on your setup.

Content:

```lua
return {
  {
    "folke/lazy.nvim",
    opts = {
      rocks = {
        enabled = false,
        hererocks = false,
      },
    },
  },
}
```

#### b. Install LuaRocks

Some advanced plugins (e.g., Treesitter-related, Neorg) may require Lua modules via LuaRocks.

To install LuaRocks on UBI7:

```bash
cd /tmp
curl -LO https://luarocks.org/releases/luarocks-3.9.2.tar.gz
tar zxvf luarocks-3.9.2.tar.gz
cd luarocks-3.9.2
./configure --prefix=$HOME/.local --with-lua-include=$HOME/neovim/include
make
make install
```

Add LuaRocks to your PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
. ~/.bashrc
```

Check installation:

```bash
luarocks --version
```

After this, you can install Lua modules like:

```bash
luarocks install lua-cjson
```

Short explanation:
- Installed only for local user ($HOME/.local).
- No root permissions needed.
- Works even on old systems without upgrading system packages.
- Helps when some plugins check for Lua modules at runtime.

---

### 6.2 Add custom options

Create:

```bash
~/.rc/nvim/lua/config/options.lua
```
or
```bash
~/.config/nvim/lua/config/options.lua
```

Content:

```lua
local opt = vim.opt

opt.relativenumber = false
```

You can add additional editor options here.
Default options that are always set: <https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua>.

---

## 7. Python Provider Setup

If Python 3 is available (3.6, 3.8, 3.9 are fine):

```bash
pip3 install --user pynvim
```

If proxy issues occur:

```bash
pip3 install --user pynvim --proxy="socks5h://127.0.0.1:1080"
```

---

## 8. Node.js and Ruby Providers

- **Node.js**: Optional. Skip because of glibc version issues on old systems.
- **Ruby**: Not required unless you specifically use Ruby-based plugins.

---

## 9. Install Recommended CLI Tools

For better Telescope search, Git management, and overall developer experience:

### 9.1 Install ripgrep (rg)

```bash
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
tar zxvf ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
sudo cp ripgrep-14.1.1-x86_64-unknown-linux-musl/rg /usr/local/bin/
```

---

### 9.2 Install fd

```bash
cd /tmp
curl -LO https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
tar zxvf fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
sudo cp fd-v10.2.0-x86_64-unknown-linux-musl/fd /usr/local/bin/
```

---

### 9.3 Install fzf

```bash
cd /tmp
curl -LO https://github.com/junegunn/fzf/releases/download/v0.61.3/fzf-0.61.3-linux_amd64.tar.gz
tar zxvf fzf-0.61.3-linux_amd64.tar.gz
sudo cp fzf /usr/local/bin/
```

---

### 9.4 Install lazygit

```bash
cd /tmp
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.49.0/lazygit_0.49.0_Linux_x86_64.tar.gz
tar zxvf lazygit_0.49.0_Linux_x86_64.tar.gz
sudo cp lazygit /usr/local/bin/
```

If you have only user permissions, you can install these CLI tools into your own `~/bin` directory:

```bash
mkdir -p ~/bin
cp fd rg fzf lazygit ~/bin
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
. ~/.bashrc
```

This way, no `sudo` is needed for anything.

---

## 10. Extending into a Full IDE (Example: C++ Development)

### 10.1 Add Plugins

Configuration file: `~/.rc/nvim/lua/plugins/cpp.lua` (`.rc`|`.conf`):

```lua
-- LSP + Completion
return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp", enabled = true },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },

  -- CMake + Task handling
  { "Civitasv/cmake-tools.nvim" },
  { "akinsho/toggleterm.nvim", version = "*" },
  { "stevearc/overseer.nvim" },

  -- Debug (DAP)
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },

  -- Navigation
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "folke/trouble.nvim" },

  -- Formatter / Linter
  -- { "nvimtools/none-ls.nvim" }, -- optional, replaced by LazyVim
}
```

### 10.2 Configure Plugins

Configuration file: `~/.rc/nvim/lua/config/cpp.lua` (`.rc`|`.conf`):

```lua
-- CMake Tools
require("cmake-tools").setup({})

-- Terminal (Toggleterm)
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = "horizontal",
})

-- Debugger (DAP)
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'gdb',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
}

-- Navigation Keymaps
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Formatter (null-ls)
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
})
```

---

## 10.3 Quick IDE Setup for Other Languages

You can extend Neovim into a full-featured IDE for other popular backend languages as well.

### Python

```lua
-- LSP (pyright) + Formatter (black) + Linter (flake8)
require("lspconfig").pyright.setup({})
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.diagnostics.flake8,
  },
})
```

### TypeScript (Backend)

```lua
-- LSP (tsserver) + Formatter (prettier) + Linter (eslint)
require("lspconfig").tsserver.setup({})
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.diagnostics.eslint,
  },
})
```

### Java

```lua
-- LSP (jdtls) via Mason
require("lspconfig").jdtls.setup({})
-- Optional: Formatter (google-java-format) can be configured separately if needed.
```

This way, Neovim can easily become a full-featured IDE for Python, TypeScript (backend), and Java, in addition to C++.

---

## 10.4 (Optional) Add AI Autocompletion with **Windsurf** (formerly Codeium)

You can further enhance your Neovim IDE with free, lightweight AI autocompletion using **[Windsurf](https://windsurf.com/)**.

Install Codeium plugin:

```lua
{
  "Exafunction/windsurf.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({})
  end,
}
```

Features:
- Works out-of-the-box, without requiring an account initially.
- Provides intelligent AI-based autocompletion for **any programming language**.
- Complements your LSP, Linter, and Formatter for an even smoother developer experience.

Useful commands:

```vim
:CodeiumEnable
:CodeiumDisable
```

Official repository: [https://github.com/Exafunction/windsurf.nvim](https://github.com/Exafunction/windsurf.nvim).

---

## 11. HealthCheck

Inside Neovim, run:

```vim
:checkhealth
```

Expected results:

| Provider | Status |
|:---|:---|
| Python | ✅ OK |
| Perl | ✅ OK |
| Node.js | ❌ Ignored (not needed) |
| Ruby | ❌ Ignored (not needed) |

---

# Final Result

You now have a **fully working**, **professional** LazyVim setup on UBI7 (or similar systems):

- Fast LSP support (clangd)
- Intelligent completion (nvim-cmp)
- CMake build support (cmake-tools.nvim)
- Debugging (nvim-dap + dap-ui)
- Git integration (gitsigns + lazygit)
- Lightning-fast file navigation (telescope.nvim + ripgrep + fd)
- Smooth formatting (clang-format via conform.nvim)

All this **without needing glibc upgrades**, running even on legacy Linux environments! 🚀
