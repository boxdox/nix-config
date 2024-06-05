{ pkgs, username, hostname, inputs, ... }:
let
  timeZone = "Asia/Kolkata";
  locale = "en_US.UTF-8";
in {
  imports = [
    ./hardware.nix
    ./nixos-modules/sound.nix
    ./nixos-modules/nvidia.nix
    ./nixos-modules/virtualization.nix
    ./nixos-modules/docker.nix
    ./nixos-modules/gnome.nix
    ./nixos-modules/steam.nix
  ];

  # bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };

  # networking
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;

  # time
  time.timeZone = "${timeZone}";

  # i18n
  i18n.defaultLocale = "${locale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${locale}";
    LC_IDENTIFICATION = "${locale}";
    LC_MEASUREMENT = "${locale}";
    LC_MONETARY = "${locale}";
    LC_NAME = "${locale}";
    LC_NUMERIC = "${locale}";
    LC_PAPER = "${locale}";
    LC_TELEPHONE = "${locale}";
    LC_TIME = "${locale}";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    asusctl
    ddcutil
    brightnessctl
    pavucontrol
    helvum
    piper
  ];

  services = {
    ratbagd.enable = true; # required by piper to config peripherals
  };
  
  # insecure packages needed by tools
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "electron-25.9.0"
  ];

  # nix config
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  
  system.stateVersion = "23.11";
}

