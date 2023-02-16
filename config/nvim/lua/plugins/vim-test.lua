return {
  {
    "vim-test/vim-test",

    dependencies = {
      "tpope/vim-dispatch",
      "kassio/neoterm",
    },

    keys = {
      { "<leader>tf", vim.cmd.TestFile, desc = "Test file" },
      { "<leader>tn", vim.cmd.TestNearest, desc = "Test Nearest" },
      { "<leader>ts", vim.cmd.TestSuite, desc = "Test Suite" },
      { "<leader>tl", vim.cmd.TestLast, desc = "Test Last" },
      { "<leader>tv", vim.cmd.TestVisit, desc = "Test Visit" },
    },
  },
}
