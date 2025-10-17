return {
  "saghen/blink.cmp",
  build = "cargo build --release", -- ou: version = "1.*"
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
    "rafamadriz/friendly-snippets",
    -- "roginfarrer/cmp-css-variables",
    -- "saghen/blink.compat",
  },

  config = function()
    local blink = require("blink.cmp")
    require("luasnip.loaders.from_vscode").lazy_load()

    blink.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
        menu = { border = "rounded" },
        documentation = { border = "rounded" },
      },

      snippets = { preset = "luasnip" },

      keymap = {
        preset = "enter",
        ["<Tab>"]   = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
        ["<C-Space>"] = { "show" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- compat  = { "css-variables" },
      },

      cmdline = {
        ["/"] = { sources = { "buffer" } },
        [":"] = { sources = { "path", "cmdline" } },
      },
    })
  end,
}
