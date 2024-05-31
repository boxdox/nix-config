{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        color_scheme = 'Catppuccin Mocha',
	font = wezterm.font 'JetBrains Mono',
	font_size = 16.0,
	window_background_opacity = 0.85,
	window_decorations = "RESIZE",
        hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false
      }
    '';
  };
}
