{ pkgs, ... }:
{
  services.jellyfin.enable = true;
  services.jellyfin.package = pkgs.jellyfin;
  services.jellyfin.user = "coast";
  services.jellyfin.hardwareAcceleration.enable = true;
  services.jellyfin.hardwareAcceleration.device = "/dev/dri/renderD128";
  services.jellyfin.hardwareAcceleration.type = "vaapi";

  systemd.services.jellyfin.environment = {
    http_proxy = "socks5://127.0.0.1:2080";
    https_proxy = "socks5://127.0.0.1:2080";
  };
}
