{ pkgs, unstablePkgs, system, username, ... }:

{
  imports = [
    ./home-modules/gnome.nix
    ./home-modules/fonts.nix
    ./home-modules/zsh-shell.nix
    ./home-modules/terminal-fu.nix
    ./home-modules/vscode.nix
    ./home-modules/git.nix
    ./home-modules/kitty.nix
    ./home-modules/obs.nix
    ./home-modules/firefox.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = (
    with pkgs; [
      # dev tools
      neovim
      sublime4
      devbox
      direnv
      lazygit
      bun
      stdenv.cc.cc.lib
      mold
      gcc

      # global cli tools
      rustup

      # work
      godot_4
      librum
      calibre
      anki
      obsidian
      thunderbird

      # design and studio
      blender
      davinci-resolve
      darktable
      ardour
      lmms
      aseprite
      handbrake

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
    ]
  ) ++ (
    with unstablePkgs; [
      pnpm
    ]
  );

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
