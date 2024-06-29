{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Mocha";
    settings = {
      kitty_mod = "super";
      font_size = 16;
      font_family = "JetBrainsMono";
      copy_on_select = "yes";
      cursor_shape = "underline";
      enable_audio_bell = "no";
      shell = "zsh";
      editor = "nvim";
      window_padding_width = 5;
      scrollback_lines = 10000;
      background_blur = 64;
      tab_bar_style = "powerline";
      hide_window_decorations = "yes";
      placement_strategy = "center";
    };
    extraConfig = ''
      background_opacity 0.85
      adjust_line_height 125%
    '';
    keybindings = {
      "kitty_mod+t" = "new_tab";
      "kitty_mod+q" = "close_tab";
      "ctrl+tab" = "next_tab";
      "ctrl+shift+tab" = "previous_tab";

      "kitty_mod+shift+t" = "new_window";
      "kitty_mod+shift+q" = "close_window";
      "kitty_mod+j" = "next_window";
      "kitty_mod+k" = "next_window";

      "kitty_mod+c" = "copy_to_clipboard";
      "kitty_mod+v" = "paste_from_clipboard";

      "kitty_mod+ctrl+j" = "resize_window taller 3";
      "kitty_mod+ctrl+k" = "resize_window shorter 3";
      "kitty_mod+ctrl+h" = "resize_window narrower 3";
      "kitty_mod+ctrl+l" = "resize_window wider 3";
    };
  };
}
