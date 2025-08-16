-- lua/core/autocmds.lua
-- For more information, see `:help autocmd`

local api = vim.api

-- Create a group for our autocommands
-- This allows us to clear them all at once, preventing duplicates
-- when we reload our configuration.
local augroup = api.nvim_create_augroup("MyAutocommands", { clear = true })

-----------------------------------------------------------
-- Highlight on Yank
-----------------------------------------------------------
-- Briefly highlight the text that was just yanked (copied).
api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", -- Use the same highlight as incremental search
      timeout = 200, -- Time in milliseconds to keep the highlight
    })
  end,
  desc = "Highlight yanked text",
})

-----------------------------------------------------------
-- Remember Cursor Position
-----------------------------------------------------------
-- When you open a file, jump to the last known cursor position.
api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  pattern = "*",
  callback = function(args)
    local mark = api.nvim_buf_get_mark(args.buf, '"')
    local line = mark[1]
    local col = mark[2]
    -- Check if the mark is valid (line > 1 and not at the end of the file)
    if line > 1 and line <= api.nvim_buf_line_count(args.buf) then
      api.nvim_win_set_cursor(0, { line, col })
    end
  end,
  desc = "Jump to last cursor position on opening a file",
})

-----------------------------------------------------------
-- Auto-resize splits on Vim resize
-----------------------------------------------------------
-- When you resize the main Neovim window, automatically equalize the splits.
api.nvim_create_autocmd("VimResized", {
  group = augroup,
  pattern = "*",
  command = "wincmd =",
  desc = "Equalize splits on window resize",
})

-----------------------------------------------------------
-- Filetype-specific settings
-----------------------------------------------------------
-- Example: Disable auto-commenting on new lines for certain file types
api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "gitcommit", "markdown", "txt" },
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
  desc = "Disable auto-commenting for specific filetypes",
})

