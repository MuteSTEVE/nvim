<h1 align="center"> Dr.MuteSTEVE Neovim config 📝</h1>

> By Dr.MuteSTEVE

Screenshot 📸
---
Hello there 👋 I'm an 18 years old [digital minimalist](https://archive.org/details/digital-minimalism-by-cal-newport) and i love Neovim ♥️. I use it for everything from learn to code, learn a project and taking daily notes 🗒️

I have no intention to get into IT job 💼 i just love learning new things as hobby and life experience

I only use the most crucial and important plugins, like: [Telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [mason](https://github.com/williamboman/mason.nvim) and the rest are just suited for my needs

![lazy-packages](./img/lazy-packages.png)

[UNIX Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) based configuation🐧
---
- [x] [KISS](https://en.wikipedia.org/wiki/KISS_principle) 
- [x] [Minimalism](https://en.wikipedia.org/wiki/Minimalism_(computing)) 
- [x] [YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it) 

> You're probably still running spyware called Microsoft windows 🪟, literally [Nineteen Eighty-Four](https://id.wikipedia.org/wiki/Nineteen_Eighty-Four) 👁️

Structure ⛓️
---
I use [Lazy loading 💤](https://en.wikipedia.org/wiki/Lazy_loading) technic to load all the plugins, so it won't feel heavy as i jumped through different file because of the pluins trigger activation. You can find it online on `how to lazy load neovim plugins` with [lazy.nvim](https://github.com/folke/lazy.nvim) or just read the docs of [lazy.nvim](https://github.com/folke/lazy.nvim) or if you are suffered from tiktok [brainrot](https://news.yahoo.com/what-is-brain-rot-tiktokers-are-using-the-term-to-describe-the-impact-of-being-chronically-online-211105483.html) that has tremendous little attention span you can do the following in your [lazy.nvim](https://github.com/folke/lazy.nvim) configuration:
```lua
require("lazy").setup({
  spec = {
    -- Change the string into your plugins directory,
    -- for example my plugins stored in lua/lsp, you don't need to include the lua directory too
    -- *it won't work if you have subdirectory, like lua/plug/something/
    -- Only works under the child directory of lua/
    { import = "lsp" }, 
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
    ├─ lsp/ ─────────────────────> LSP configuration
    │  ├─ lspconfig.lua
    │  └─ mason.lua
    └─ plug/ ────────────────────> All plugins configuration
       ├─ cmp.lua
       ├─ colorscheme.lua
       ├─ gitsigns.lua
       ├─ md-preview.lua
       ├─ obsidian.lua
       ├─ session.lua
       ├─ telescope.lua
       └─ treesitter.lua
    init.lua ────────────────────> sourcing everything here

Bonus 💥
---
Did you know that [lazy.nvim](https://github.com/folke/lazy.nvim) has builtin `float term API`, yes you can actually use it for something like terminal or lazygit whatever your shell command is. I personally use that API to use:
- [ranger](https://github.com/ranger/ranger) 📂 inside of neovim, eliminates the needs of file browser plugins

![ranger](./img/ranger.png) 
- [lazygit](https://github.com/jesseduffield/lazygit) 💤 to use git with floating UI window

![lazygit](./img/lazygit.png) 
- [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) 🎵to listen music

![ncmpcpp](./img/ncmpcpp.png) 
- [zsh shell](https://ohmyz.sh/) 🐌 if i need to do simple things with floating shell

![zsh](./img/zsh.png) 

Yes i indeed use [picom](https://wiki.archlinux.org/title/Picom) to make a beautiful transparent window and [tmux](https://github.com/tmux/tmux) for terminal multiplexer
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
Closing
---
That's about it from me, thank you so much for visiting my lonley repo 🫠

<h3 align="center">Don't forget to give ⭐ to this repo</h3>

<div align="center">
    <img src="./img/meme.jpg" width="400" align="center">
</div>
