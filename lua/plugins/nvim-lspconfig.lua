return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
	  require('mason').setup()
	  require('mason-lspconfig').setup {
            automatic_installation = true,
          }
	end
}