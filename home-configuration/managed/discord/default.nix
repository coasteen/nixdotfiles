{ pkgs, ... }:
{
  home.packages = [ pkgs.vesktop ];

  # change the desktop file
  xdg.desktopEntries.vesktop.comment = "VESKTOP, a Discord client, running on socks5:2080";
  xdg.desktopEntries.vesktop.name = "Vesktop (Modified)";
  xdg.desktopEntries.vesktop.genericName = "Discord client";
  xdg.desktopEntries.vesktop.exec = "vesktop --proxy-server=\"socks5://127.0.0.1:2080 %U\"";
  xdg.desktopEntries.vesktop.icon = "vesktop";
  xdg.desktopEntries.vesktop.type = "Application";
  xdg.desktopEntries.vesktop.categories = [ "Network" "InstantMessaging" ];
}
