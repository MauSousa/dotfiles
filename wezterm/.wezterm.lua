-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Maia (Gogh)'
-- config.color_scheme = 'Apprentice (base16)'
-- config.color_scheme = 'Apprentice (Gogh)'
config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = 'Cobalt Neon'
-- config.color_scheme = '3024 Day (Gogh)'

-- Font
config.font = wezterm.font('IosevkaTerm Nerd Font')
config.font_size = 14

-- Scrollback lines
config.scrollback_lines = 1000000

config.keys = {
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = '<',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'm',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = '>',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- Tab bar
-- config.enable_tab_bar = false

-- Background and blur
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
