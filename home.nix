{ pkgs, inputs, username, ... }:

{
  imports = [
    ./home-modules/gnome.nix
    ./home-modules/fonts.nix
    ./home-modules/zsh-shell.nix
    ./home-modules/git.nix
    ./home-modules/firefox.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
      # dev tools
      neovim
      vscode

      # global cli tools
      rustup
      corepack 

      # terminal-fu
      wezterm
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
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
