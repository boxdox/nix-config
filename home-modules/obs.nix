{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      wlrobs
      obs-vaapi
      obs-nvfbc
      droidcam-obs
      obs-pipewire-audio-capture
    ];
  };
}
