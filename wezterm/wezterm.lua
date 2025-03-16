-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- タブを下に表示（デフォルトでは上にある）
config.tab_bar_at_bottom = true

-- タブが2つ以上のときのみ、タブを表示させる
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font {
    family = 'JetBrains Mono',
    weight = 'Medium',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
  }

  -- フォントサイズ
config.font_size = 12.5

-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.85

-- キーバインディングの設定
config.keys = {
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    -- ⌘ Ctrl hjklでペインの移動
    {
        key = 'h',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'l',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    -- ⌘ Ctrl Shift hjklでペイン境界の調整
    {
        key = 'h',
        mods = 'CMD|CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Left', 2 },
    },
    {
        key = 'j',
        mods = 'CMD|CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Down', 2 },
    },
    {
        key = 'k',
        mods = 'CMD|CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Up', 2 },
    },
    {
        key = 'l',
        mods = 'CMD|CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Right', 2 },
    },
    -- Option + Spaceでアプリ非表示
    -- TODO: iTerm2みたいに表示/非表示のようにしたい。
    {
        key = 'Space',
        mods = 'OPT',
        action = wezterm.action.HideApplication
    },
}

return config
