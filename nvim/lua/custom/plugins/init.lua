return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'kylechui/nvim-surround',
  'skywind3000/asyncrun.vim',
  { 'numToStr/Comment.nvim', opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },


}
