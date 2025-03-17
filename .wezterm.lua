local wezterm = require 'wezterm'
local config = {}

config.enable_tab_bar = false
config.font = wezterm.font 'RecMonoCasual Nerd Font Mono'

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  { 
    key = 'h', 
    mods = 'ALT', 
    action = wezterm.action.ActivateTabRelative(-1) 
  },
  { 
    key = 'l', 
    mods = 'ALT', 
    action = wezterm.action.ActivateTabRelative(1) 
  },
  { 
    key = 'k', 
    mods = 'CMD', 
    action = wezterm.action.ActivateCommandPalette 
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  { 
    key = 'h', 
    mods = 'SHIFT|ALT', 
    action = wezterm.action.MoveTabRelative(-1) 
  },
  { 
    key = 'l', 
    mods = 'SHIFT|ALT', 
    action = wezterm.action.MoveTabRelative(1) 
  },
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'j',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  { 
    key = 'k', 
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 } 
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
}

return config
