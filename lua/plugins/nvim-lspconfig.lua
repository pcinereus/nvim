
local config = function()
  local lspconfig = require('lspconfig')
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

  for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

  lspconfig.r_language_server.setup {
    -- on_attach = on_attach,
    -- capabilities = capabilities,
    -- flags = lsp_flags,
    settings = {
      r = {
        lsp = {
          rich_documentation = false
        },
      },
    },
  }
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")

  -- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			-- "python",
			-- "json",
			-- "jsonc",
			-- "sh",
			-- "javascript",
			-- "javascriptreact",
			-- "typescript",
			-- "typescriptreact",
			-- "svelte",
			-- "vue",
			-- "markdown",
			-- "docker",
			-- "solidity",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
	-- 			-- python = { flake8, black },
	-- 			-- typescript = { eslint_d, prettierd },
	-- 			-- json = { eslint_d, fixjson },
	-- 			-- jsonc = { eslint_d, fixjson },
	-- 			-- sh = { shellcheck, shfmt },
	-- 			-- javascript = { eslint_d, prettierd },
	-- 			-- javascriptreact = { eslint_d, prettierd },
	-- 			-- typescriptreact = { eslint_d, prettierd },
	-- 			-- svelte = { eslint_d, prettierd },
	-- 			-- vue = { eslint_d, prettierd },
	-- 			-- markdown = { alex, prettierd },
	-- 			-- docker = { hadolint, prettierd },
	-- 			-- solidity = { solhint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = config,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
      -- 	config = function()
      -- 	--   require('mason').setup()
      -- 	--   require('mason-lspconfig').setup {
      --   --     automatic_installation = true,
      --   --   }

      -- 	   local lspconfig = require('lspconfig')
      -- 	   local cmp_nvim_lsp = require('cmp_nvim_lsp')
      --      local util = require("lspconfig.util")
      --      local on_attach = function(client, bufnr)
      -- 	   	 local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      --   	 local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      --   	 buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      --   	 local opts = { noremap = true, silent = true }

      -- 		 buf_set_keymap('n', 'gS', '<cmd>Telescope lsp_document_symbols<CR>', opts)
      --   	 buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
      --   	 buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
      --   	 buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      --   	 buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      --   	 buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
      --   	 buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
      --   	 buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      --  		 buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      --   	 buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
      --   	 buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      --   	 buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
      --   	 client.server_capabilities.document_formatting = true
      -- 	   end

      -- 	   -- local lsp_flags = {
      --      --   allow_incremental_sync = true,
      --      --   debounce_text_changes = 150,
      -- 	   -- }

      -- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- -- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      -- -- capabilities.textDocument.completion.completionItem.snippetSupport = true
      -- 	     -- lspconfig.r_language_server.setup {
      --        --     on_attach = on_attach,
      --        -- 	 capabilities = capabilities,
      --        -- 	 flags = lsp_flags,
      --        -- 	 settings = {
      --        -- 	    r = {
      --        -- 	      lsp = {
      --        --  	         rich_documentation = false
      --        -- 	       },
      --        -- 	     },
      --        -- 	 },
      --        --  }


      -- 	end
}
