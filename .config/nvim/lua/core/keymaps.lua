local M = {}

local keymaps = {
    -- Navigation between splits -------------------------------
    { "n", "<leader>c",       ":nohup",                                                                                                   { desc = "Clear selection colors" } },

    -- Navigation between splits -------------------------------
    { "n", "<C-h>",       "<C-w>h",                                                                                                   { desc = "Window: Move to left split" } },
    { "n", "<C-j>",       "<C-w>j",                                                                                                   { desc = "Window: Move to bottom split" } },
    { "n", "<C-k>",       "<C-w>k",                                                                                                   { desc = "Window: Move to top split" } },
    { "n", "<C-l>",       "<C-w>l",                                                                                                   { desc = "Window: Move to right split" } },

    -- Crating and Closing splits ------------------------------
    { "n", "<leader>sh",  ":split<CR>",                                                                                               { desc = "Split window horizontally" } },
    { "n", "<leader>sv",  ":vsplit<CR>",                                                                                              { desc = "Split window vertically" } },
    { "n", "<leader>sx",  ":close<CR>",                                                                                               { desc = "Close current split window" } },

    -- Window Resizing -----------------------------------------
    { "n", "<C-A-k>",     ":resize -2<CR>",                                                                                           { desc = "Window: Decrease height" } },
    { "n", "<C-A-j>",     ":resize +2<CR>",                                                                                           { desc = "Window: Increase height" } },
    { "n", "<C-A-h>",     ":vertical resize -2<CR>",                                                                                  { desc = "Window: Decrease width" } },
    { "n", "<C-A-l>",     ":vertical resize +2<CR>",                                                                                  { desc = "Window: Increase width" } },

    -- Visual Mode Text Movement -------------------------------
    { "v", "J",           ":m '>+1<CR>gv=gv",                                                                                         { desc = "Visual: Move selection down" } },
    { "v", "K",           ":m '<-2<CR>gv=gv",                                                                                         { desc = "Visual: Move selection up" } },
    { "v", "<",           "<gv",                                                                                                      { desc = "Visual: Indent selection left" } },
    { "v", ">",           ">gv",                                                                                                      { desc = "Visual: Indent selection right" } },

    -- Buffer Navigation ----------------------------------------
    { "n", "<S-l>",       ":bn<CR>",                                                                                                  { desc = "Buffer: Next buffer" } },
    { "n", "<S-h>",       ":bp<CR>",                                                                                                  { desc = "Buffer: Previous buffer" } },
    { "n", "<leader>bd",  ":bd<CR>",                                                                                                  { desc = "Buffer: Close buffer" } },

    -- Nvim-Tree Commands ---------------------------------------
    { "n", "<leader>tt",  function() require "nvim-tree.api".tree.toggle() end,                                                       { noremap = true, silent = true, desc = "Toggle NvimTree" } },

    -- Telescope Commands ---------------------------------------
    { "n", "<leader>ff",  function() require('telescope.builtin').find_files() end,                                                   { desc = "Telescope: Find files" } },
    { "n", "<leader>fcb", function() require('telescope.builtin').current_buffer_fuzzy_find() end,                                    { desc = "Telescope: Find files" } },
    { "n", "<leader>fa",  function() require('telescope.builtin').find_files({ follow = true, no_ignore = true, hidden = true }) end, { desc = "Telescope: Find files (incl. ignored & hidden)" } },
    { "n", "<leader>fg",  function() require('telescope.builtin').live_grep() end,                                                    { desc = "Telescope: Live grep" } },
    { "n", "<leader>fb",  function() require('telescope.builtin').buffers() end,                                                      { desc = "Telescope: List open buffers" } },
    { "n", "<leader>fh",  function() require('telescope.builtin').help_tags() end,                                                    { desc = "Telescope: Search help tags" } },
    { "n", "<leader>fo",  function() require('telescope.builtin').oldfiles() end,                                                     { desc = "Telescope: Recently open files" } },
    { "n", "<leader>fc",  function() require('telescope.builtin').colorscheme() end,                                                  { desc = "Telescope: Switch colorscheme" } },

    -- Blink.cmp Commands ---------------------------------------
    { "i", "<A-1>",       function() require("blink.cmp").accept({ index = 1 }) end,                                                  { desc = "Blink CMP: Accept item 1" } },
    { "i", "<A-2>",       function() require("blink.cmp").accept({ index = 2 }) end,                                                  { desc = "Blink CMP: Accept item 2" } },
    { "i", "<A-3>",       function() require("blink.cmp").accept({ index = 3 }) end,                                                  { desc = "Blink CMP: Accept item 3" } },
    { "i", "<A-4>",       function() require("blink.cmp").accept({ index = 4 }) end,                                                  { desc = "Blink CMP: Accept item 4" } },
    { "i", "<A-5>",       function() require("blink.cmp").accept({ index = 5 }) end,                                                  { desc = "Blink CMP: Accept item 5" } },
    { "i", "<A-6>",       function() require("blink.cmp").accept({ index = 6 }) end,                                                  { desc = "Blink CMP: Accept item 6" } },
    { "i", "<A-7>",       function() require("blink.cmp").accept({ index = 7 }) end,                                                  { desc = "Blink CMP: Accept item 7" } },
    { "i", "<A-8>",       function() require("blink.cmp").accept({ index = 8 }) end,                                                  { desc = "Blink CMP: Accept item 8" } },
    { "i", "<A-9>",       function() require("blink.cmp").accept({ index = 9 }) end,                                                  { desc = "Blink CMP: Accept item 9" } },
    { "i", "<A-10>",      function() require("blink.cmp").accept({ index = 0 }) end,                                                  { desc = "Blink CMP: Accept item 10" } },

}

function M.setup()
    for _, map in ipairs(keymaps) do
        local mode, lhs, rhs, opts = unpack(map)
        opts = opts or {}
        opts.silent = opts.silent ~= false
        opts.noremap = opts.noremap ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

function M.on_lsp_attach(bufnr)
    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            desc = "LSP: " .. desc,
        })
    end

    -- LSP on_attach mappings -----------------------------------
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Find references")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format code")
    map("n", "gl", vim.diagnostic.open_float, "Show line diagnostics")
end

function M.on_nvim_tree_attach(bufnr)
    require "nvim-tree.api".config.mappings.default_on_attach(bufnr)

    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
            desc = "NvimTree: " .. desc,
        })
    end


    -- NvimTree on_attach mappings ----------------------------------
    map('n', '<C-t>', require "nvim-tree.api".tree.change_root_to_parent, 'Up')
    map('n', '?', require "nvim-tree.api".tree.toggle_help, 'Help')
    map("n", "<CR>", require "nvim-tree.api".node.open.edit, 'Open')
    map("n", "AFT", require "nvim-tree.api".fs.create, 'Create')
    map("n", "d", require "nvim-tree.api".fs.remove, 'Delete')
    map("n", "r", require "nvim-tree.api".fs.rename, 'Rename')
end

return M
