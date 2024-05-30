{ config, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };  

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  # setup prime offload to use nvidia only when needed
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    }; 

    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
