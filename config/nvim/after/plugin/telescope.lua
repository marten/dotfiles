local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files,      { desc = 'Find [P]ath (telescope)' })
vim.keymap.set('n', '<C-p>',     builtin.git_files,       { desc = 'Find [P]ath (telescope)' })

vim.keymap.set('n', '<leader>f', builtin.live_grep,       { desc = '[F]ind (telescope)' })
vim.keymap.set('n', '<C-f>',     builtin.live_grep,       { desc = '[F]ind (telescope)' })

vim.keymap.set('n', '<leader>b', builtin.buffers,         { desc = '[B]uffers (telescope)' })
vim.keymap.set('n', 'gb',        builtin.buffers,         { desc = '[B]uffers (telescope)' })

vim.keymap.set('n', '<leader>o', builtin.oldfiles,        { desc = 'Recently [O]pened files (telescope)' })

vim.keymap.set('n', 'gh',        builtin.help_tags,       { desc = '[G]o [H]elp (telescope)'})

vim.keymap.set('n', '<leader>r', builtin.grep_string,     { desc = '[A]ppearances (telescope)',noremap = true })
vim.keymap.set('n', 'gr',        builtin.grep_string,     { desc = '[G]rep [R]eferences (telescope)', noremap = true })

vim.keymap.set('n', '<leader>k', builtin.keymaps,         { desc = '[K]eymaps (telescope)',noremap = true })
vim.keymap.set('n', '<leader>c', builtin.command_history, { desc = '[C]ommand history (telescope)',noremap = true })
vim.keymap.set('n', 'gt',        builtin.tags,            { desc = '[G]o to C[T]ags (telescope)', noremap = true })

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- Enable telescope fzf native, if installed
require('telescope').load_extension('fzf')


