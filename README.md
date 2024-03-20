Config layout
---

I fuckin' hate to make my neovim as heavy as possible with bunch of bloated plugins

    lua/
    ├─ core/
    │  ├─ autocmd.lua
    │  ├─ icons.lua
    │  ├─ keymaps.lua
    │  ├─ lazy.lua
    │  ├─ options.lua
    │  └─ statusline.lua
    ├─ lsp/
    │  ├─ lspconfig.lua
    │  └─ mason.lua
    └─ plug/
       ├─ cmp.lua
       ├─ colorscheme.lua
       ├─ gitsigns.lua
       ├─ obsidian.lua
       ├─ session.lua
       ├─ telescope.lua
       └─ treesitter.lua
    init.lua
