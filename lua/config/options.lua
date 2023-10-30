local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2         -- number of spaces for a tab character
opt.shiftwidth = 2      -- number of spaces for indentation
opt.softtabstop = 2     -- number of spaces for tab in insert mode
opt.expandtab = true    -- converts tabs to spaces when openning files
opt.smartindent = true  -- allows for auto-indentation
opt.wrap = false        -- allow long lines

-- Search
opt.incsearch = true    -- highlight search matches
opt.ignorecase = true   -- ingnore case when searching
opt.smartcase = true    -- where there is capitalisation - use it in search
opt.hlsearch = true     -- highlight the search

-- Appearance
opt.number = true           -- want line numbers
opt.relativenumber = true   -- relative line numbers
opt.termguicolors = true
opt.colorcolumn = "100"     -- insert a line at 100 characters width
opt.signcolumn = "yes"      -- larger gutter width to allow for debug icons
opt.cmdheight = 1           -- minibuffer (cmd) space one line height
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true           -- change buffers without saving
opt.errorbells = false      -- turn off noises
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")    -- ignore a -.  It is just part of a word
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")  -- add the register plus to clipboard
opt.modifiable = true
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"