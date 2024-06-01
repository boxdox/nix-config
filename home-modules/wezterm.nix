{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        color_scheme = 'Catppuccin Mocha',
	font = wezterm.font 'JetBrains Mono',
	font_size = 16.0,
	window_background_opacity = 0.85,
	window_decorations = "RESIZE",
        hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	window_padding = {
          left = '0.5cell',
          right = '0.5cell',
          top = '0.5cell',
          bottom = '0.5cell',
	},

	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
          { key = "a",          mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
	  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
	  { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },

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
          { key = "[",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
          { key = "]",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
          { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
	},

	key_tables = {
	  resize_pane = {
            { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
	    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
   	    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
   	    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
   	    { key = "Escape", action = "PopKeyTable" },
   	    { key = "Enter",  action = "PopKeyTable" },
	  },
	  move_tab = {
            { key = "h",      action = act.MoveTabRelative(-1) },
            { key = "j",      action = act.MoveTabRelative(-1) },
            { key = "k",      action = act.MoveTabRelative(1) },
            { key = "l",      action = act.MoveTabRelative(1) },
            { key = "Escape", action = "PopKeyTable" },
            { key = "Enter",  action = "PopKeyTable" },
	  },
	},
      }
    '';
  };
}
