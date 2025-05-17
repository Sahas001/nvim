-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'windwp/nvim-ts-autotag',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<C-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  { 'nvim-neotest/nvim-nio' },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-go',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-go',
        },
      }
      vim.keymap.set('n', '<leader>tt', "<cmd> lua require('neotest').run.run() <CR>", { noremap = true, silent = true, desc = 'Run nearest test' })
      vim.keymap.set(
        'n',
        '<leader>tf',
        "<cmd> lua require('neotest').run.run(vim.fn.expand('%')) <CR>",
        { noremap = true, silent = true, desc = 'Run tests in file' }
      )
      vim.keymap.set('n', '<leader>ts', "<cmd> lua require('neotest').summary.toggle() <CR>", { noremap = true, silent = true, desc = 'Toggle test summary' })
      vim.keymap.set(
        'n',
        '<leader>to',
        "<cmd> lua require('neotest').output.open({ enter = true }) <CR>",
        { noremap = true, silent = true, desc = 'Open test output' }
      )
      vim.keymap.set(
        'n',
        '<leader>td',
        "<cmd> lua require('neotest').run.run({ strategy = 'dap' }) <CR>",
        { noremap = true, silent = true, desc = 'Debug nearest test' }
      )
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true -- Disable default <Tab> mapping

      -- Use <C-l> (Ctrl + k) for accepting Copilot suggestions
      -- vim.keymap.set('i', '<C-k>', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, desc = 'Accept Copilot suggestion' })
      vim.api.nvim_set_keymap('i', '<C-k>', 'copilot#Accept("")', { expr = true, silent = true, noremap = true, desc = 'Accept Copilot suggestion' })

      -- Use <C-[> (Ctrl + [) for navigating previous Copilot suggestions
      vim.keymap.set('i', '<C-[>', '<Plug>(copilot-previous)', { noremap = true, silent = true, desc = 'Previous Copilot suggestion' })

      -- Use <C-]> (Ctrl + ]>) for navigating next Copilot suggestions
      vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)', { noremap = true, silent = true, desc = 'Next Copilot suggestion' })

      -- Use <C-\\> (Ctrl + \\) to trigger Copilot suggestion manually
      vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)', { noremap = true, silent = true, desc = 'Trigger Copilot suggestion' })
    end,
  },
}
