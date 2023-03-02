return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-d>"] = function(...)
            return require("telescope.actions").delete_buffer(...)
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
}
