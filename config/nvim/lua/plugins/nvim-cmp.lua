return {
  {
    "hrsh7th/nvim-cmp",
    -- The only override/change here compared to upstream default is that <CR> mapping is set to select=false
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")

      opts.completion = {
        completeopt = "noselect",
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      })
    end,
  },
}
