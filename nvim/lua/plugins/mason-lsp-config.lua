return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufRead",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "rust_analyzer" },
    }
  end
}
