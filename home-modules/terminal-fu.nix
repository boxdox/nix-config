{ pkgs, ... }:
{
  # some tools which are not managed by home-manager
  home.packages = with pkgs; [
    procs
    tokei
  ];

  # bat - cat alternative
  programs.bat = {
    enable = true;
    config = {
      theme = "zenburn";
      style = "numbers,changes";
      tabs = "2";
      pager = "less -FR";
    };
  };

  # bottom - top alternative
  programs.bottom = {
    enable = true;
    settings = {
      "temperature_type" = "c";
    };
  };

  # eza - modern ls
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = true;
    extraOptions = [
      "--long"
      "--group-directories-first"
      "--color=always"
      "--binary"
    ];
  };

  # fd - find alternative
  programs.fd = {
    enable = true;
    extraOptions = [
      "--list-details"
      "--follow"
    ];
  };

  # fzf - cmdline fuzzy finder
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # jq - json previewer
  programs.jq.enable = true;

  # ripgrep - grep alternative
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns-preview"
      "--colors=line:style:bold"
      "--smart-case"
    ];
  };
  
  # tmux
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    shell = "\${pkgs.zsh}/bin/zsh";
  };
  
  # yazi - terminal file manager
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  # zoxide - smarter cd replacement
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd" # replace cd
    ];
  };
}
