local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("", " ", "<Nop>", opts)
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Open Explore
keymap("n", "<space>e", ":Explore<CR>", opts)

-- Telescope
keymap("n", "<space>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<space>pd", "<cmd>Telescope lsp_definitions<CR>", opts) --revisar
keymap("n", "<space>pr", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<space>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<space>uuuu", "<cmd>Telescope lsp_document_diagnostics<cr>", opts)
keymap("n", "<space>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)

keymap("n", "<space>w", "<cmd>bdelete!<CR>", opts)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<space>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("v", "<space>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Debugger
keymap("n", "<space>dt","<cmd>lua require'dap'.toggle_breakpoint()<cr>",opts)
keymap("n", "<space>dd", "<cmd>Telescope dap configurations<CR>",opts)
keymap("n", "<space>dq", "<cmd>DapTerminate<cr>",opts)
keymap("n", "<space>dn", "<cmd>lua require'dap'.step_over()<cr>",opts)
keymap("n", "<space>di", "<cmd>lua require'dap'.step_into()<cr>",opts)
keymap("n", "<space>do", "<cmd>lua require'dap'.step_out()<cr>",opts)
keymap("n", "<space>dc", "<cmd>lua require'dap'.continue()<cr>",opts)

-- Terminal --
keymap("n","<C-\\>", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n","<space>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)
keymap("n","<space>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
keymap("n","<space>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
