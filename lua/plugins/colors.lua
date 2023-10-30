return {
  { 'shaunsingh/nord.nvim' },
  { 'folke/tokyonight.nvim' },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    name = "nightfox",
    priority = 1000,
    config = function()
       vim.cmd('colorscheme nightfox')
    end
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --    vim.cmd('colorscheme catppuccin')
    -- end
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    name = "onedarkpro",
    priority = 1000,
    -- config = function()
    --    vim.cmd('colorscheme onedarkpro')
    -- end
  },

  -- -- color html colors
  -- {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require 'colorizer'.setup {
  --       css = { css_fn = true, css = true },
  --       'javascript',
  --       'html',
  --       'r',
  --       'rmd',
  --       'qmd',
  --       'markdown',
  --       'python'
  --     }
  --   end
  -- },
}