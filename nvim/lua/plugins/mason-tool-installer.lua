return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "ormolu",
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
