return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "svelte",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "lua",
        "python",
        "rust",
        "yaml",
        "json",
        "markdown",
        "markdown_inline",
        "haskell",
      },
      sync_install = false,
      auto_install = true,
    })

    -- Enable treesitter-based highlighting
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
