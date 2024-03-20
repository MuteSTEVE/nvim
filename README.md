<h1 align="center"> Dr.MuteSTEVE Neovim config 🐧</h1>

> By Dr.MuteSTEVE ♥️

Screenshot
---
Who says you need bazillion plugins to use neovim? [ThePrimeagen approved](https://www.youtube.com/@ThePrimeagen) 
I only use the most crucial and important plugins, like: [Telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [mason](https://github.com/williamboman/mason.nvim) and the rest are just suited for my needs

![lazy-packages](./img/lazy-packages.png)

[UNIX Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) based configuation
---
- [x] [KISS](https://en.wikipedia.org/wiki/KISS_principle) 
- [x] [Minimalism](https://en.wikipedia.org/wiki/Minimalism_(computing)) 
- [x] [YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it) 

> Linux & [UNIX-HATERS](https://en.wikipedia.org/wiki/The_UNIX-HATERS_Handbook) better start bitching with their [soydev](https://www.urbandictionary.com/define.php?term=Soydev) vscode
> probably running spyware called Microsoft 🅱️indows, literally [Nineteen Eighty-Four](https://id.wikipedia.org/wiki/Nineteen_Eighty-Four) 

Structure
---
I use [Lazy loading](https://en.wikipedia.org/wiki/Lazy_loading) technic to load all the plugins, so it won't feel heavy as i jumped through different file because of the pluins trigger activation. You can find it online on `how to lazy load neovim plugins` with [lazy.nvim](https://github.com/folke/lazy.nvim) or just read the docs of [lazy.nvim](https://github.com/folke/lazy.nvim) or if you are suffered from tiktok [brainrot](https://news.yahoo.com/what-is-brain-rot-tiktokers-are-using-the-term-to-describe-the-impact-of-being-chronically-online-211105483.html) that has tremendous little attention span you can do the following in your [lazy.nvim](https://github.com/folke/lazy.nvim) configuration:
```lua
lazy.setup({
  spec = {
    -- Change the string into your plugins directory,
    -- for example my plugins stored in lua/lsp, you don't need to include the lua directory too
    -- if you have subdirectory like lua/something/something, don't use "lua/something/something/",
    -- instead use "something.something" following lua string guidelines
    { import = "lsp" }, 
    { import = "md" },
    { import = "plug" },
  }
)
```
    lua/
    ├─ core/ ────────────────────> All the core components, including lazy.nvim
    │  ├─ autocmd.lua
    │  ├─ icons.lua
    │  ├─ keymaps.lua
    │  ├─ lazy.lua
    │  ├─ options.lua
    │  └─ statusline.lua
    ├─ cmp/ ─────────────────────> nvim-cmp and it's sources suggestion
    │  ├─ cmp.lua
    │  └─ nvim_lua.lua
    ├─ lsp/ ─────────────────────> LSP configuration
    │  ├─ lspconfig.lua
    │  └─ mason.lua
    ├─ md/ ──────────────────────> Markdown plugins
    │  ├─ md-preview.lua
    │  └─ obsidian.lua
    └─ plug/ ────────────────────> Universal plugins
       ├─ cmp.lua
       ├─ colorscheme.lua
       ├─ gitsigns.lua
       ├─ session.lua
       ├─ telescope.lua
       └─ treesitter.lua
    init.lua ────────────────────> sourcing everything here

Bonus
---
Did you know that [lazy.nvim](https://github.com/folke/lazy.nvim) has builtin `float term API`, yes you can actually use it for something like terminal or lazygit whatever your shell command is. I personally use that API to use [ranger](https://github.com/ranger/ranger)   file manager inside of neovim, eliminates the needs of file browser plugins
```lua
local map = vim.keymap.set
local float_term = require("lazy.util").float_term
map("n", "<A-l>", "<cmd>Lazy<CR>")
map("n", "<leader>g", function()
    float_term({ "lazygit" })
  end)
map("n", "<leader>lg", function()
    float_term({ "lazygit" })
  end)
map("n", "<leader>t", function()
    float_term({ "zsh" })
  end)
map("n", "<leader>ll", function()
    float_term({ "lazygit", "log" })
  end)
map("n", "<leader>r", function()
    float_term({ "ranger" })
  end)
map("n", "<leader>m", function()
    float_term({ "ncmpcpp" })
  end)
```

<h3 align="center">Don't forget to give ⭐ to this repo</h3>

<div align="center">
    <img src="./img/meme.jpg" width="400" align="center">
</div>
