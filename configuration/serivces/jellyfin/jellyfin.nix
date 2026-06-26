{ pkgs, ... }:
{
  services.jellyfin.enable = true;
  services.jellyfin.package = pkgs.jellyfin;
  services.jellyfin.user = "coasteen";
  services.jellyfin.hardwareAcceleration.enable = true;
  services.jellyfin.hardwareAcceleration.device = "/dev/dri/renderD128";
}
