{ lib, pkgs, ... }:
let
  pname = "prismlauncher";
  version = "11.0.2-1";
  src = pkgs.fetchurl {
    url = "https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/${version}/PrismLauncher-Linux-x86_64.AppImage";
    hash = "sha256-P+6s4g8uCqXQx0p5rieJFpuDV7AquGVYrcTs9XWFAsA=";
  };
  icon = pkgs.fetchurl {
    url = "https://upload.wikimedia.org/wikipedia/commons/7/74/Prism_Launcher_logo.svg";
    hash = "sha256-AQexWc1uadtsYQpTTwI3BVCJQyfV2AZ/jxNWshyFxnE=";
  };
in
{
  home.packages = [
    (pkgs.appimageTools.wrapType2 {
      inherit pname version src;
      meta = {
        description = "Cracked version of Prism Launcher";
        platforms = [ "x86_64-linux" ];
        sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
      };
    })
  ];
  home.file.".local/share/icons/hicolor/scalable/apps/prismlauncher.svg".source = icon;
  xdg.desktopEntries.prismlauncher.comment = "Cracked version of Prism Launcher";
  xdg.desktopEntries.prismlauncher.name = "Prism Launcher (Modified)";
  xdg.desktopEntries.prismlauncher.genericName = "Prism Launcher client";
  xdg.desktopEntries.prismlauncher.exec = "prismlauncher";
  xdg.desktopEntries.prismlauncher.icon = "prismlauncher";
}
