return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { exclude = { "node_modules", "generated" } },
        grep = { exclude = { "node_modules", "generated"} },
      },
    },
  },
  keys = {
    { "<leader>ff", function() require("snacks.picker").files() end, desc = "Find files" },
{ "gr", function() require("snacks.picker").lsp_references() end, nowait = true, desc = "References" },
    { "<leader>sw", function() require("snacks.picker").grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fm", function() require("snacks.picker").smart() end, desc = "Find files" },
    { "<leader>fw", function() require("snacks.picker").grep() end, desc = "Find Words" },
    { "<leader>fc", function() require("snacks.picker").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  },
}
