vim.lsp.config("pyright", {
    settings = {
        python = {
            analysis = {
                -- typeCheckingMode = "strict",
                autoImportCompletions = true,
            },
        },
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})


return {
    'neovim/nvim-lspconfig',
    config = function()
        vim.lsp.config("*", {
            capabilities = vim.lsp.protocol.make_client_capabilities()
        })
    end
}
