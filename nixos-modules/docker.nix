{ pkgs, username, ... }:
{
  virtualisation.docker = {
    enable = true;
    #enableOnBoot = true;

    autoPrune = {
      enable = true;
      flags = [ "--all" ];
    };
  };

  environment.systemPackages = with pkgs; [
    lazydocker
    docker-buildx
    docker-compose
  ];

  users.users.${username}.extraGroups = [ "docker" ];
}
