{ pkgs, inputs, username, ... }:

{
  imports = [
    ./home-modules/gnome.nix
    ./home-modules/fonts.nix
    ./home-modules/zsh-shell.nix
    ./home-modules/git.nix
    ./home-modules/wezterm.nix
    ./home-modules/obs.nix
    ./home-modules/firefox.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
      # dev tools
      neovim
      vscode
      sublime4
      devbox
      direnv
      lazygit
      bun
      mold

      # global cli tools
      rustup
      fnm

      # work
      blender
      davinci-resolve
      darktable
      ardour
      lmms
      #aseprite # unable to build
      godot_4
      handbrake
      #librum
      calibre
      anki
      obsidian

      # entertainment
      vlc
      freetube
      jellyfin-media-player
      spotify
      spicetify-cli

      # social
      webcord

      # utilities
      yt-dlp
      aria2
      ffmpeg
      p7zip
      localsend
      syncthing
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
