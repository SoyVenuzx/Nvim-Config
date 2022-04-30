-- Keybindings
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Windows navs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })

-- Insert/ESC
map("i", "jk", "<ESC>", { noremap = true, silent = false })
map("i", "kj", "<ESC>", { noremap = true, silent = false })

-- TreeToggle
-- map("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Indentation
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

map(
	"n",
	"<c-u>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
	{ noremap = true, silent = true }
)
map("n", "<c-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })

-- Movement
vim.cmd("nnoremap J 10j")
vim.cmd("nnoremap K 10k")

-- Resizing
map("n", "<left>", ":vertical resize +5<cr>", { noremap = true, silent = true })
map("n", "<right>", ":vertical resize -5<cr>", { noremap = true, silent = true })
map("n", "<down>", ":resize -5<cr>", { noremap = true, silent = true })
map("n", "<up>", ":resize +5<cr>", { noremap = true, silent = true })

-- Prettier
-- map("n", "gp", ":silent %!prettier --stind-filepath %<CR>", { noremap = true, silent = false })
