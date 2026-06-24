{ pkgs, ... }:
let
  appImage = pkgs.fetchurl {
    url = "https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/11.0.2-1/PrismLauncher-Linux-x86_64.AppImage";
    hash = "sha256-P+6s4g8uCqXQx0p5rieJFpuDV7AquGVYrNTs9XWFAsA=";
  };
in
{
  xdg.desktopEntries.prismlauncher.comment = "Cracked version of Prism Launcher";
  xdg.desktopEntries.prismlauncher.name = "Prism Launcher (Modified)";
  xdg.desktopEntries.prismlauncher.genericName = "Prism Launcher client";
  xdg.desktopEntries.exec = "${pkgs.appimage-run}/bin/appimage-run ${appImage}";
  xdg.desktopEntries.terminal = false;
  xdg.desktopEntries.type = "Application";
}
