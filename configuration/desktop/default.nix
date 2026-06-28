{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.plasma-login-manager.enable = true;

  #x11
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;

  #niriwm
  programs.niri.enable = false;
  programs.niri.useNautilus = true;
  programs.niri.package = pkgs.niri;
}
