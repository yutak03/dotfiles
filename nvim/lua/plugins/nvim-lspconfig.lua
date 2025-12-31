return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lsp_servers = { "lua_ls", "pyright", "ruff", "ts_ls", "html", "yamlls", "jsonls", "rust_analyzer", "svelte", "hls" }
    local diagnostics = { "typos_lsp" }
    local nvim_lsp = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
      handlers = {
        -- デフォルトハンドラー
        function(server_name)
          nvim_lsp[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- pyright用のカスタム設定
        ["pyright"] = function()
          nvim_lsp.pyright.setup {
            capabilities = capabilities,
            root_dir = nvim_lsp.util.root_pattern(".venv", "pyproject.toml", ".git"),
            settings = {
              python = {
                venvPath = ".",
                pythonPath = "./.venv/bin/python",
              }
            }
          }
        end,
        -- rust-analyzer用のカスタム設定
        ["rust_analyzer"] = function()
          nvim_lsp.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy",
                },
              }
            }
          }
        end,
        -- svelte用のカスタム設定
        ["svelte"] = function()
          nvim_lsp.svelte.setup {
            capabilities = capabilities,
          }
        end,
      },
    }

    -- 保存時フォーマット
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.rs", "*.lua", "*.py", "*.ts", "*.tsx", "*.js", "*.jsx", "*.svelte", "*.hs" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- カーソル下の変数の情報
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    -- 定義ジャンプ
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    -- 定義ジャンプ後に下のファイルに戻る
    vim.keymap.set('n', 'gt', '<C-t>')
    -- フォーマット
    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
    -- カーソル下の変数をコード内で参照している箇所
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- 変数名のリネーム
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  end,
}
