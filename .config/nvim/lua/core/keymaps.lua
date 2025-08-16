-- lua/core/keymaps.lua
-- For more information, see `:help key-mapping`

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- General Keymaps
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
keymap("n", "<leader>c", ":nohl<CR>", { desc = "Clear search highlighting" })

-- Exit terminal mode with jk
keymap("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable the Ex mode key
keymap("n", "Q", "<nop>", opts)

-----------------------------------------------------------
-- Window and Split Management
-----------------------------------------------------------

-- Split windows
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Close current split
keymap("n", "<leader>sx", "<C-w>c", { desc = "Close current split" })

-- Navigate between splits using Ctrl + hjkl
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease split height" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase split height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })

-----------------------------------------------------------
-- Buffer Management
-----------------------------------------------------------

-- Navigate between buffers with Shift + hl
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Close a buffer
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close (delete) buffer" })

-----------------------------------------------------------
-- Editing Enhancements
-----------------------------------------------------------

-- Move selected lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Paste without losing the yanked text
keymap("v", "p", '"_dP', { desc = "Paste without losing yank" })

