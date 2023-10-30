
local keymap = vim.keymap
return  {
{
    'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
	keys = {
		keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
		keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
		keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
		keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
	},
    config = function()
      local telescope = require 'telescope'
      local actions = require('telescope.actions')
      local previewers = require("telescope.previewers")
      local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then return end
          if stat.size > 100000 then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end
      telescope.setup {
        defaults = {
          buffer_previewer_maker = new_maker,
          file_ignore_patterns = { "node_modules", "%_files/*.html", "%_cache", ".git/", "site_libs", ".venv" },
          layout_strategy = "flex",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ["<esc>"] = actions.close,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-k>"] = actions.move_selection_previous,
            }
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*",
              '--glob', '!**/.Rproj.user/*', '-L' },
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        }
      }
      telescope.load_extension('ui-select')
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('file_browser')
      telescope.load_extension('dap')
    end
  },

  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

}
-- local keymap = vim.keymap


-- local config = function()
-- 	local telescope = require("telescope")
-- 	telescope.setup({
-- 		defaults = {
-- 			mappings = {
-- 				i = {
-- 					["<C-j>"] = "move_selection_next",
-- 					["<C-k>"] = "move_selection_previous",
-- 				},
-- 			},
-- 		},
-- 		pickers = {
-- 			find_files = {
-- 				-- theme = "ivy",
-- 				previewer = true,
-- 				hidden = true,
-- 			},
-- 			live_grep = {
-- 				-- theme = "dropdown",
-- 				previewer = true,
-- 			},
-- 			buffers = {
-- 				-- theme = "dropdown",
-- 				previewer = true,
-- 			},
-- 		},
-- 	})
-- end

-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	tag = "0.1.3",
-- 	lazy = false,
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = config,
-- 	keys = {
-- 		keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
-- 		keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
-- 		keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
-- 		keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
-- 		keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
-- 	},
-- }