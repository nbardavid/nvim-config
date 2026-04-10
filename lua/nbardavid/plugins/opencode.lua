return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
        terminal = {}, -- Enables the `snacks` provider
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      terminal = {
        win = {
          position = "float",
          relative = "editor",
          width = 0,
          height = 0,
          row = 0,
          col = 0,
          border = "none",
          enter = true,
          bo = {
            filetype = "opencode_terminal",
            buflisted = true,
            bufhidden = "hide",
          },
        },
      },
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

    vim.keymap.set("n", "<leader>of", function() require("opencode").toggle() end, { desc = "Opencode fullscreen" })
    vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Opencode ask this" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Opencode select" })
    vim.keymap.set("n", "<leader>oc", function() require("opencode").command() end, { desc = "Opencode command" })
    vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "Opencode new session" })
    vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Opencode interrupt" })
    vim.keymap.set("n", "<leader>oo", function() require("opencode").command("agent_cycle") end, { desc = "Opencode cycle agent" })
    vim.keymap.set({ "n", "x" }, "<leader>oe", function() require("opencode").prompt("Explain @this and its context", { submit = true }) end, { desc = "Opencode explain" })
    vim.keymap.set("n", "<leader>od", function() require("opencode").prompt("Review the following git diff for correctness and readability: @diff", { submit = true }) end, { desc = "Opencode diff review" })
    vim.keymap.set({ "n", "x" }, "<leader>ot", function() require("opencode").prompt("Add tests for @this", { submit = true }) end, { desc = "Opencode test this" })

    vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
