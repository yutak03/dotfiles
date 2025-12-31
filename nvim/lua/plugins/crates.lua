return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local crates = require("crates")
    crates.setup({
      completion = {
        cmp = {
          enabled = true,
        },
      },
    })

    -- Cargo.toml用キーマップ
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = "Cargo.toml",
      callback = function()
        local opts = { buffer = true, silent = true }
        vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
        vim.keymap.set("n", "<leader>cr", crates.reload, opts)
        vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
        vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
        vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
        vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
      end,
    })
  end,
}
