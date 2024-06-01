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
      devbox
      direnv

      # global cli tools
      rustup
      #volta # volta doesn't work with nix-store, need to re-visit in future

      # terminal-fu
      bat
      eza
      fd
      fzf
      procs
      ripgrep
      tokei
      bottom
      zoxide
      tmux

      # entertainment
      vlc
      jellyfin-media-player

      # social
      webcord

      # work
      blender
      davinci-resolve
      handbrake

      # utilities
      yt-dlp
      ffmpeg
      p7zip
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
