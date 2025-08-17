local DEFAULT_SETTINGS = {
}

local function setup_server(server, opts)
  opts = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, opts or {})
  require("lspconfig")[server].setup(opts)
end

setup_server("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoImportCompletions = true,
      },
    },
  },
})

setup_server("lua_ls", {
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
}
