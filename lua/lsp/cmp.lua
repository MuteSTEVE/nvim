local PLUG = {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    { 'hrsh7th/cmp-buffer', event = "InsertEnter" },
    { 'hrsh7th/cmp-path', event = "InsertEnter" },
    { 'hrsh7th/cmp-cmdline', event = "InsertEnter" },
    { 'hrsh7th/cmp-nvim-lsp', event = "InsertEnter" },
    { 'hrsh7th/cmp-nvim-lua', event = "InsertEnter" },
    { 'saadparwaiz1/cmp_luasnip', event = "InsertEnter" },
    {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      {
        'ults-io/vscode-react-javascript-snippets',
        build = 'yarn install --frozen-lockfile && yarn compile',
      },
    }
  },
}

function PLUG.config()
  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok then
    return
  end
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return
  end
  local snip_ok, snip = pcall(require, "luasnip/loaders/from_vscode")
  if not snip_ok then
    return
  end
  snip.lazy_load()
  local icons_ok, icons = pcall(require, 'core.icons')
  if not icons_ok then
    return
  end

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local IK = icons.kind_icons
  local kind_icons = {
    Class = IK.Class,
    Color = IK.Color,
    Constant = IK.Constant,
    Constructor = IK.Constructor,
    Enum = IK.Enum,
    EnumMember = IK.EnumMember,
    Event = IK.Event,
    Field = IK.Field,
    File = IK.File,
    Folder = IK.Folder,
    Function = IK.Function,
    Interface = IK.Interface,
    Keyword = IK.Keyword,
    Method = IK.Method,
    Module = IK.Module,
    Namespace = "",
    Operator = IK.Operator,
    Property = IK.Property,
    Reference = IK.Reference,
    Snippet = IK.Snippet,
    Struct = IK.Struct,
    Text = IK.Text,
    TypeParameter = IK.TypeParameter,
    Unit = IK.Unit,
    Value = IK.Value,
    Variable = IK.Variable,
  }

  local mappings = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
        "i",
        "s",
      }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
        "i",
        "s",
      }),
  }

  local sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }

  local formattings = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  }

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = mappings,
    formatting = formattings,
    sources = sources,
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
  }

  -- Use buffer source for '/', '?', ':'
  cmp.setup.cmdline({ '/', '?', ':' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  -- cmdline setup.
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
  })
  vim.cmd("highlight Pmenu guibg=NONE")
end

return PLUG
