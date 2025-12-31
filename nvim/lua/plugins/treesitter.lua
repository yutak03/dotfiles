return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  main = "nvim-treesitter.configs",
  opts = {
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
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}
