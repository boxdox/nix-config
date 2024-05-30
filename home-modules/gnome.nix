{ pkgs, ... }:
{
  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      size = "compact";
      tweaks = [ "rimless" ];
    };

    iconTheme = {
      name = "La-capitaine-icon-theme";
      package = pkgs.la-capitaine-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    bluetooth-quick-connect
    rounded-window-corners
    gtile
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Ice";
      icon-theme = "La-capitaine-icon-theme";
      gtk-theme = "Catppuccin-Mocha-Compact-Mauve-Dark";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
        
    # configure blur-my-shell
    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.85;
      dash-opacity = 0.25;
      sigma = 15; 
      static-blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel".blur = true;
    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = true;
      style-dialogs = 0;
    };

    # configure Bluetooth Quick Connect
    "org/gnome/shell/extensions/bluetooth-quick-connect" = {
      keep-menu-on-toggle = true;
      refresh-button-on = true;
      show-batter-icon-on = true;
    };
  };
}
