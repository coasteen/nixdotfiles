{ pkgs, ... }:
{
  programs.obs-studio.enable = true;
  programs.obs-studio.package = (pkgs.obs-studio.override { cudaSupport = true; });
  programs.obs-studio.plugins = [
    pkgs.obs-studio-plugins.wlrobs
    pkgs.obs-studio-plugins.obs-backgroundremoval
    pkgs.obs-studio-plugins.obs-vaapi
    pkgs.obs-studio-plugins.obs-gstreamer
    pkgs.obs-studio-plugins.obs-vkcapture
  ];
}
