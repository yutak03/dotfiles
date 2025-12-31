return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    vim.opt.termguicolors = true
    require("bufferline").setup{}

    -- Keymaps
    local opts = { noremap = true, silent = true }
    -- Tab / Shift+Tab でバッファ切り替え
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
    -- 番号でバッファ移動
    vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
    vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
    vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
    vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
    vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
    vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
    vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
    vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
    vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
    -- バッファを閉じる
    vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts)
  end
}
