local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		ensure_installed = {
			"markdown",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"bash",
			"lua",
			"dockerfile",
			"solidity",
			"gitignore",
			"r",
			"python",
			"vue",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = grc,
				node_decremental = "<BS>",
            			-- init_selection = "gnn",
            			-- node_incremental = "grn",
            			-- scope_incremental = "grc",
            			-- node_decremental = "grm",
			},
		},
		textobjects = {
          		select = {
			       enable = true,
            		       lookahead = true,
            		       keymaps = {
              			       -- You can use the capture groups defined in textobjects.scm
              			       ['af'] = '@function.outer',
              			       ['if'] = '@function.inner',
              			       ['ac'] = '@class.outer',
              			       ['ic'] = '@class.inner',
            			},
          		},
			move = {
            		     enable = true,
            		     set_jumps = true, -- whether to set jumps in the jumplist
            		     goto_next_start = {
			     		[']m'] = '@function.outer',
              				[']]'] = '@class.inner',
            		},
            		goto_next_end = {
              			[']M'] = '@function.outer',
              			[']['] = '@class.outer',
            		},
            		goto_previous_start = {
              			['[m'] = '@function.outer',
				['[['] = '@class.inner',
			},
            		goto_previous_end = {
              			['[M'] = '@function.outer',
              			['[]'] = '@class.outer',
			},
          	},
            },
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}