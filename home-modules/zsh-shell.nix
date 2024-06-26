{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 50000;
      save = 10000;
      expireDuplicatesFirst = true;
      extended = true;
    };
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(direnv hook zsh)"
    '';
    shellAliases = {
      c = "clear";
      v = "nvim";
      cat = "bat";
      ls = "exa -lb --icons";
      la = "exa -lab --icons";
      ll = "exa -lah --icons";
      pn = "pnpm";
      grep = "rg";
    };
    sessionVariables = {
      LD_LIBRARY_PATH = "$HOME/.nix-profile/lib:$LD_LIBRARY_PATH";
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
