{ ... }:
{
  programs.git = {
    enable = true;
    userName = "boxdox";
    userEmail = "19517445+boxdox@users.noreply.github.com";
    aliases = {
      ls = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      s = "status";
      a = "add .";
      c = "commit";
      b = "branch";
      am = "commit --amend --no-edit";
    };
    attributes = [
      "*.sqlite diff=sqlite3"
    ];
    extraConfig = {
      core = {
        editor = "nvim";
        autoclrf = false;
        autocrlf = "input";
        ignorecase = false;
      };
      log.date = "iso";
      init.defaultBranch = "main";
      fetch.prune = true;
      push.followtags = true;
      push.autoSetupRemote = true;
      commit.verbose = true;
      rerere.enabled = true;
    };
  };
}
