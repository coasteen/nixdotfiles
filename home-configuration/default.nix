{ config, pkgs, ... }:
let
  configs = {
    niri = "niri";
    alacritty = "alacritty";
    rofi = "rofi";
    #waybar = "waybar";
    nvim = "nvim";
    zathura = "zathura";
    quickshell = "quickshell";
  };
in
{
  imports = [
    ./managed/waybar/default.nix
    ./managed/discord/default.nix
    ./managed/git/default.nix
    ./managed/prismlauncher/prismlauncher.nix
  ];
  home.username = "coast";
  home.homeDirectory = "/home/coast";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  xdg.configFile = builtins.mapAttrs
    (key: subpath: {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Configuration/home-configuration/config/${subpath}";
      recursive = true;
    })
    configs;
  gtk.enable = true;
  gtk.colorScheme = "dark";
  gtk.cursorTheme.package = pkgs.adwaita-icon-theme;
  gtk.cursorTheme.name = "Adwaita Cursor Theme";
  qt.enable = true;
  qt.kvantum.enable = true;
  qt.kvantum.themes = [
    pkgs.gruvbox-kvantum
    pkgs.catppuccin-kvantum
  ];
  home.packages = [
    pkgs.python3
    pkgs.starship
    pkgs.libarchive
    pkgs.fastfetch
    pkgs.alacritty
    pkgs.awww
    pkgs.xwayland-satellite
    pkgs.telegram-desktop
    pkgs.tauon
    pkgs.mpv
    pkgs.jdk25
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.qbittorrent
    pkgs.nautilus
    pkgs.xray
    pkgs.git
    pkgs.gnumake
    pkgs.clang
    pkgs.clang-tools
    pkgs.haskell-language-server
    pkgs.imagemagick
    pkgs.xclip
    pkgs.picom
    pkgs.dnsutils
    pkgs.python3Packages.pip
    pkgs.cmake
    pkgs.libtool
    pkgs.brightnessctl
    pkgs.pkg-config
    pkgs.lua
    pkgs.lua-language-server
    pkgs.rust-analyzer
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.clippy
    pkgs.ffmpeg
    pkgs.mumble
    pkgs.eog
    pkgs.zathura
    pkgs.gimp3
    pkgs.gamescope
    pkgs.xkill
    pkgs.trayer
    pkgs.obs-studio
    pkgs.quickshell
    pkgs.libnotify
    pkgs.kdePackages.kdenlive
    pkgs.obs-cmd
  ];
}
