local M = {}

function M.setup()
    -- Globals -------------------------------------------------
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Interface & Display -------------------------------------
    vim.opt.number = true         -- Show absolute line numbers
    vim.opt.relativenumber = true -- Show relative line numbers
    vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
    vim.opt.cursorline = true     -- Highlight the line under the cursor
    vim.opt.signcolumn = "yes"    -- Always show the sign column
    vim.opt.showmode = false      -- Don’t show mode since statusline/plugin likely handles it
    vim.opt.title = true          -- Set terminal window title based on file info:contentReference[oaicite:0]{index=0}
    vim.opt.laststatus = 2        -- Always display the status line

    -- Search & Navigation -------------------------------------
    vim.opt.ignorecase = true -- Case-insensitive searching...
    vim.opt.smartcase = true  -- ...unless uppercase is used
    vim.opt.wrap = false      -- no line wrap
    vim.opt.incsearch = true  -- Show search matches as you type
    vim.opt.hlsearch = true   -- Highlight all search matches
    vim.opt.scrolloff = 4     -- Keep 4 lines visible above/below cursor
    vim.opt.sidescrolloff = 8 -- Keep 8 columns visible to the left/right

    -- Indenting & Tabs ----------------------------------------
    vim.opt.autoindent = true  -- Maintain indent of current line
    vim.opt.smartindent = true -- Smart indenting for code
    vim.opt.expandtab = true   -- Use spaces instead of tabs
    vim.opt.shiftwidth = 4     -- Width for auto-indent
    vim.opt.tabstop = 4        -- Treat tab as 4 spaces

    -- Editing Behavior ----------------------------------------
    vim.opt.clipboard = "unnamedplus" -- Use system clipboard
    vim.opt.confirm = true            -- Prompt when quitting with unsaved changes
    vim.opt.autoread = true           -- Reload file if changed outside Vim
    vim.opt.autowrite = true          -- Auto-save before actions like :next
    vim.opt.swapfile = false          -- Disable swapfile
    vim.opt.backup = false            -- Disable backup file
    vim.opt.undofile = true           -- Enable persistent undo
    vim.opt.updatetime = 250          -- Shorten time before triggering CursorHold, etc.
    vim.opt.timeoutlen = 300          -- Time to wait for key sequence to complete

    -- Completion & UI Enhancements -----------------------------
    vim.opt.completeopt = "menu,menuone,noselect" -- Better completion behavior
    vim.opt.inccommand = "split"                  -- Live preview for :substitute:contentReference[oaicite:1]{index=1}
    vim.opt.pumheight = 10                        -- Max height for popup menus
    vim.opt.pumblend = 10                         -- Make popup menu translucent
    vim.opt.winblend = 0                          -- No transparency for normal windows
    vim.o.winborder = 'rounded'                   -- Default borders for floating windows

    -- Mouse, Splits & Misc ------------------------------------
    vim.opt.mouse = "a"       -- Enable mouse for all modes
    vim.opt.splitright = true -- Vertical splits go to the right
    vim.opt.splitbelow = true -- Horizontal splits go below

    -- File-type Detection & Plugins ---------------------------
    vim.opt.syntax = "on" -- Enable syntax highlighting:contentReference[oaicite:3]{index=3}
    vim.opt.background =
    "dark"                -- (Optional) Use settings optimized for dark themes:contentReference[oaicite:4]{index=4}

    -- Advanced Completion Suggestions --------------------------
    vim.opt.wildmenu = true -- Enhanced command-line completion:contentReference[oaicite:6]{index=6}
    vim.opt.wildmode =
    "longest:full,full"     -- Show matches as list and complete as much as possible:contentReference[oaicite:7]{index=7}
end

return M
