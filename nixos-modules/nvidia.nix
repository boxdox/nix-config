{ config, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;

    powerManagement.enable = false;

    # setup prime offload to use nvidia only when needed
    prime = {
      # # use `offload` to use gpu on demand
      # offload = {
      #   enable = true;
      #   enableOffloadCmd = true;
      # };

      # use `sync` to always use gpu
      sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot.kernelParams = [ "nvidia-modeset.disable_vrr_memclk_switch=1" ];
}
