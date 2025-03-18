local wezterm = require 'wezterm'
local config = {}
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local config = wezterm.config_builder()

config.inactive_pane_hsb = {
  saturation = 0.4,
  brightness = 0.8,
}

bar.apply_to_config(config, {
  separator = {
    space = 1,
    left_icon = '/',
    right_icon = '',
    field_icon = wezterm.nerdfonts.indent_line,
  },
  modules = {
    tabs = {
      active_tab_fg = 4,
      inactive_tab_fg = 8,
    },
    workspace = {
      enabled = false
    },
    leader = {
      enabled = false
    },
    pane = {
      enabled = false,
      icon = wezterm.nerdfonts.cod_multiple_windows,
      color = 7,
    },
    username = {
      enabled = false,
    },
    hostname = {
      enabled = false,
    },
    clock = {
      icon = '',
      color = 4,
    },
    cwd = {
      enabled = false,
    }
  }
})

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
local function is_vim(pane)
  -- This gsub is equivalent to POSIX basename(3)
  -- Given "/foo/bar" returns "bar"
  -- Given "c:\\foo\\bar" returns "bar"
  local process_name = string.gsub(pane:get_foreground_process_name(), '(.*[/\\])(.*)', '%2')
  return process_name == 'nvim' or process_name == 'vim'
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

config.font = wezterm.font 'RecMonoCasual Nerd Font Mono'

config.keys = {
    -- move between split panes
    split_nav('move', 'h'),
    split_nav('move', 'j'),
    split_nav('move', 'k'),
    split_nav('move', 'l'),
    -- resize panes
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
--  {
--    key = 'h',
--    mods = 'CTRL',
--    action = wezterm.action.ActivatePaneDirection 'Left',
--  },
--  {
--    key = 'l',
--    mods = 'CTRL',
--    action = wezterm.action.ActivatePaneDirection 'Right',
--  },
--  {
--    key = 'k',
--    mods = 'CTRL',
--    action = wezterm.action.ActivatePaneDirection 'Up',
--  },
--  {
--    key = 'j',
--    mods = 'CTRL',
--    action = wezterm.action.ActivatePaneDirection 'Down',
--  },
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


