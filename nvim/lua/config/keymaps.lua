local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n")     -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<TAB>", "bnext", "n")
mapkey("<S-TAB>", "bprevious", "n")
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n")  -- Switch to Other Buffer
mapkey("<leader>bd", "bdelete", "n")
mapkey("<leader>w", "w|bd", "n")

-- Directory Navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>,", "NvimTreeToggle", "n")

-- Line Navigation
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = false }) -- center buffer after going down page
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = false }) -- center buffer after going up page

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n")            -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n")            -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n")            -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n")            -- Navigate Right
mapkey("<C-h>", "wincmd h", "t")          -- Navigate Left
mapkey("<C-j>", "wincmd j", "t")          -- Navigate Down
mapkey("<C-k>", "wincmd k", "t")          -- Navigate Up
mapkey("<C-l>", "wincmd l", "t")          -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n")  -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n")  -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n")    -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>|", "vsplit", "n")           -- Split Vertically
mapkey("<leader>-", "split", "n")            -- Split Horizontally
mapkey("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimise

-- Indenting
mapkey("<", "v", "<gv") -- Shift Indentation to Left
mapkey(">", "v", ">gv") -- Shift Indentation to Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })

-- Folding
mapkey("<leader>z", "za", "n") -- Toggle fold under cursor
mapkey("<leader>Z", "zA", "n") -- Toggle all folds under cursor recursively
mapkey("<leader>zo", "zo", "n") -- Open fold under cursor
mapkey("<leader>zc", "zc", "n") -- Close fold under cursor
mapkey("<leader>zO", "zO", "n") -- Open all folds under cursor recursively
mapkey("<leader>zC", "zC", "n") -- Close all folds under cursor recursively
