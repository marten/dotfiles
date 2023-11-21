return {
  {

    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.load_extension("live_grep_args")
      telescope.setup(opts)
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-d>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
            ["<C-k>"] = function()
              return require("telescope").extensions.live_grep_args.live_grep_args()
            end,
          },
          n = {
            ["<C-d>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
        },
      },
    },
  },
}
