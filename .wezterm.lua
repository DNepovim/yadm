local wezterm = require 'wezterm'
local config = {}
local config = wezterm.config_builder()

config.default_prog = {"/opt/homebrew/bin/fish", "--login"}
config.harfbuzz_features = { 'calt=0' }
config.default_cwd = '/Users/dominikblaha/projects'

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.9,
}

config.enable_tab_bar = false

config.colors = {
  foreground = '#f3f3f3',
  background = '#222',
  tab_bar = {
    background = '#111111',
    active_tab = {
      bg_color = '#111111',
      fg_color = 'yellow',
    },
    inactive_tab = {
      bg_color = '#111111',
      fg_color = '#fff',
    }
  }
}

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == 'true'
end


local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

config.show_new_tab_button_in_tab_bar = false

config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.keys = {
    split_nav('move', 'h'),
    split_nav('move', 'j'),
    split_nav('move', 'k'),
    split_nav('move', 'l'),
    split_nav('resize', 'h'),
    split_nav('resize', 'j'),
    split_nav('resize', 'k'),
    split_nav('resize', 'l'),
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
    mods = 'CMD', 
    action = wezterm.action.ActivateTabRelative(-1) 
  },
  { 
    key = 'l', 
    mods = 'CMD', 
    action = wezterm.action.ActivateTabRelative(1) 
  },
  { 
    key = 'k', 
    mods = 'CMD', 
    action = wezterm.action.ActivateCommandPalette 
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

