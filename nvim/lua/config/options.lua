local opt = vim.opt

--Tab/Indentations
opt.tabstop = 2        -- spaces per tab
opt.shiftwidth = 2     -- spaces per indentation
opt.softtabstop = 2    -- spaces per tab when in insert mode
opt.expandtab = true   -- expands tabs into spaces if needed
opt.smartindent = true -- allows for auto indentation
opt.wrap = false       -- lines won't wrap when viewing

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.statuscolumn = '%s%{v:relnum}'
-- opt.statuscolumn = "%s%{v:lnum}|%{v:relnum}"
opt.termguicolors = true
-- opt.colorcolumn = "100"
opt.signcolumn = "yes:1"
opt.foldcolumn = "0" -- Show fold column with fold icons
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
--opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
