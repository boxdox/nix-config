{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      local config = wezterm.config_builder()

      config.color_scheme = 'Catppuccin Mocha'
      config.font = wezterm.font 'JetBrains Mono'
      config.font_size = 16.0
      config.window_background_opacity = 0.85
      config.window_decorations = "RESIZE"
      config.hide_tab_bar_if_only_one_tab = true
      config.use_fancy_tab_bar = false
      config.window_padding = {
          left = '0.5cell',
          right = '0.5cell',
          top = '0.5cell',
          bottom = '0.5cell',
      }
      config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

      config.keys = {
        -- general
        { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },
        { key = "x",          mods = "CTRL|SHIFT",  action = act.ActivateCopyMode },
	{ key = "v", 		mods = "CTRL|SHIFT",  action = act({ PasteFrom = "Clipboard" }) },
	{ key = "c", 		mods = "CTRL|SHIFT",  action = act({ CopyTo = "ClipboardAndPrimarySelection" }) },

        -- pane management
        { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = "v",          mods = "LEADER",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
        { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
        { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
        { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
        { key = "q",          mods = "LEADER",      action = act.CloseCurrentPane { confirm = true } },

        -- tab management
        { key = "t",          mods = "LEADER",      action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "Tab", 	      mods = "CTRL",	    action = act({ ActivateTabRelative = 1 }) },
	{ key = "Tab",        mods = "CTRL|SHIFT",  action = act({ ActivateTabRelative = -1 }) },
        { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
      }

      return config
    '';
  };
}
