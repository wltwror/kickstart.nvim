-- markview.nvim: Markdown preview inside Neovim
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>m', '<cmd>Markview toggle<CR>', desc = 'Toggle [M]arkview preview' },
  },
  opts = {},
}
