{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 50000;
      save = 10000;
      expireDuplicatesFirst = true;
      extended = true;
    };
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      eval "$(devbox global shellenv --init-hook)"
    '';
    shellAliases = {
      c = "clear";
      v = "nvim";
      cat = "bat --style=numbers";
      ls = "exa -lb --icons";
      la = "exa -lab --icons";
      ll = "exa -lah --icons";
      pn = "pnpm";
      grep = "rg";
      cd = "z";
      cdi = "zi";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      directory = {
        truncation_length = 2;
	fish_style_pwd_dir_length = 1;
      };
    };
  };
}
