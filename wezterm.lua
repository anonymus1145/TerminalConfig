-- Pull in the wezterm API
local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action

-- Maximize on startup
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)
--
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.window_background_opacity                  = 1.0 -- ranges from 0.0 to 1.0
config.window_decorations                         = "RESIZE"
config.window_close_confirmation                  = "NeverPrompt"
-- config.tab_bar_at_bottom                          = true
config.use_fancy_tab_bar                          = false

config.inactive_pane_hsb                          = {
  saturation = 0.8,
  brightness = 0.7
}

-- Download the font from https://www.jetbrains.com/lp/mono/
config.font                                       = wezterm.font("JetBrains Mono", {weight="Bold", stretch="Normal", style="Normal"})
config.font_size                                  = 12
config.line_height                                = 1.2

-- Disable dead keys - https://en.wikipedia.org/wiki/Dead_key
config.use_dead_keys                              = false
config.scrollback_lines                           = 5000

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab               = true

config.color_scheme                               = 'Glacier'

config.window_frame                               = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',

}

config.colors                                     = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

-- taken from https://github.com/enkia/tokyo-night-vscode-theme
local primary_bg                                  = '#24283b';

local tab_bar_colors                              = {
  bg = primary_bg,
  active = {
    bg = primary_bg,
    fg = '#7aa2f7',
  },
  inactive = {
    bg = primary_bg,
    fg = '#565f89',
    hover = {
      bg = '#414868',
      fg = '#bdc7f0',
    }
  },
  new = {
    bg = primary_bg,
    fg = '#bdc7f0',
    hover = {
      bg = primary_bg,
      fg = '#cfc9c2',
    }
  },
}

config.colors                                     = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = tab_bar_colors.bg,

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = tab_bar_colors.active.bg,
      -- The color of the text for the tab
      fg_color = tab_bar_colors.active.fg,

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = tab_bar_colors.inactive.bg,
      fg_color = tab_bar_colors.inactive.fg,
      italic = true

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = tab_bar_colors.inactive.hover.bg,
      fg_color = tab_bar_colors.inactive.hover.fg,
      italic = false,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = tab_bar_colors.new.bg,
      fg_color = tab_bar_colors.new.fg,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = tab_bar_colors.new.hover.bg,
      fg_color = tab_bar_colors.new.hover.fg,
      -- italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

config.window_background_opacity                  = 1.0

-- Key mappings
config.keys                                       = {
  -- { key = 'l', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },
  -- { key = 'h', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
  -- { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down', },
  -- { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up', },
  -- { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  -- { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  -- { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  -- { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  -- { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  -- { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  -- { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  -- { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  -- { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  -- { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  -- { key = 'Enter', mods = 'CMD', action = act.ActivateCopyMode },
  { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = 'c', mods = 'CMD',  action = act.CopyTo 'Clipboard' },
  {
    key = 'U',
    mods = 'CTRL',
    action = act.CharSelect { copy_on_select = true, copy_to =
    'ClipboardAndPrimarySelection' }
  },
  { key = '`',     mods = 'CTRL',        action = act.ActivatePaneDirection 'Next' },
  { key = 'p',     mods = 'CMD',         action = act.PasteFrom 'Clipboard' },
  { key = 'i',     mods = 'CMD',         action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'o',     mods = 'CMD',         action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'w',     mods = 'CMD',         action = act.CloseCurrentTab { confirm = true } },
  { key = 'x',     mods = 'CMD',         action = act.CloseCurrentPane { confirm = true } },
  { key = '{',     mods = 'SHIFT|ALT',   action = act.MoveTabRelative(-1) },
  { key = '}',     mods = 'SHIFT|ALT',   action = act.MoveTabRelative(1) },
  { key = 'b',     mods = 'LEADER|CTRL', action = act.SendString '\x02', },
  { key = 'Enter', mods = 'LEADER',      action = act.ActivateCopyMode, },
  { key = 'p',     mods = 'LEADER',      action = act.PasteFrom 'Clipboard' },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = act.Multiple
        {
          act.ClearScrollback 'ScrollbackAndViewport',
          act.SendKey { key = 'L', mods = 'CTRL' },
        },
  },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, }
}

-- and finally, return the configuration to wezterm
return config
