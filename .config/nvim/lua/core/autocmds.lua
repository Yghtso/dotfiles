local M = {}

function M.setup()
    local keymaps = require('core.keymaps')
    local augroup = vim.api.nvim_create_augroup("yghtso", { clear = true })


    vim.api.nvim_create_autocmd("TextYankPost", {
        group = augroup,
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 40,
            })
        end,
        desc = "Highlight yanked text",
    })



    vim.api.nvim_create_autocmd("BufReadPost", {
        group = augroup,
        pattern = "*",
        callback = function(args)
            local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
            local line = mark[1]
            local col = mark[2]
            if line > 1 and line <= vim.api.nvim_buf_line_count(args.buf) then
                vim.api.nvim_win_set_cursor(0, { line, col })
            end
        end,
        desc = "Jump to last cursor position on opening a file",
    })



    vim.api.nvim_create_autocmd("VimResized", {
        group = augroup,
        pattern = "*",
        command = "wincmd =",
        desc = "Equalize splits on window resize",
    })



    vim.api.nvim_create_autocmd("FileType", {
        group = augroup, pattern = { "gitcommit", "markdown", "txt" },
        callback = function()
            vim.opt_local.formatoptions:remove("c")
            vim.opt_local.formatoptions:remove("r")
            vim.opt_local.formatoptions:remove("o")
        end,
        desc = "Disable auto-commenting for specific filetypes",
    })



    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            vim.bo[args.buf].formatexpr = nil -- Unset 'formatexpr'
            vim.bo[args.buf].omnifunc = nil -- Unset 'omnifunc'
            keymaps.on_lsp_attach(args.buf)
        end,
    })
end

return M
