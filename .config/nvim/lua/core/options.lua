-- lua/core/options.lua
-- For more information, see `:help option-list`

local opt = vim.opt -- A shorthand for vim.opt

-----------------------------------------------------------
-- Editor Appearance
-----------------------------------------------------------
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier navigation
opt.cursorline = true -- Highlight the current line
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.signcolumn = "yes" -- Always show the sign column to prevent screen shifting 
opt.laststatus = 3 -- Use a global statusline
opt.showmode = false -- Don't show the mode, lualine will handle it
opt.pumheight = 10 -- Make the completion menu taller
opt.pumblend = 10 -- Make the completion menu slightly transparent
opt.winblend = 0 -- No transparency for floating windows

-- Configure how certain characters are displayed
opt.list = true -- Show invisible characters
opt.listchars = {
  tab = "» ", -- Character for a tab
  trail = "·", -- Character for trailing whitespace
  nbsp = "␣", -- Character for a non-breaking space
}

-----------------------------------------------------------
-- Indentation and Formatting
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.smartindent = true -- Make indenting smart
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.wrap = false -- Do not wrap lines

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, it will be case-sensitive
opt.incsearch = true -- Show search results as you type
opt.hlsearch = true -- Highlight all search matches

-----------------------------------------------------------
-- File and Buffer Management
-----------------------------------------------------------
opt.undofile = true -- Persist undo history
opt.swapfile = false -- We don't need a swap file with modern systems
opt.backup = false -- No backup files
opt.autowrite = true -- Automatically save before running commands
opt.confirm = true -- Confirm before quitting with unsaved changes
opt.splitright = true -- New vertical splits go to the right
opt.splitbelow = true -- New horizontal splits go to the bottom

-----------------------------------------------------------
-- Performance and Behavior
-----------------------------------------------------------
opt.updatetime = 250 -- Time in ms to wait before writing swap file and triggering CursorHold
opt.timeoutlen = 300 -- Time in ms to wait for a mapped sequence to complete
opt.scrolloff = 8 -- Keep 8 lines of context around the cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns of context around the cursor when scrolling
opt.mouse = "a" -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use the system clipboard for yank and put
opt.completeopt = "menu,menuone,noselect" -- Set completion options
opt.inccommand = "split" -- Preview substitutions live in a split window

