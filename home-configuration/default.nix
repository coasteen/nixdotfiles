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
    ./managed/waybar
    ./managed/discord
    ./managed/git
    ./managed/prismlauncher
    ./managed/obs-studio
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk.enable = true;
  systemd.user.sessionVariables = config.home.sessionVariables;
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
    pkgs.mpv
    pkgs.jdk25
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.qbittorrent
    pkgs.nautilus
    pkgs.caja
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
    pkgs.quickshell
    pkgs.libnotify
    pkgs.kdePackages.kdenlive
    pkgs.obs-cmd
    pkgs.gedit
    pkgs.feishin
    pkgs.gnome-themes-extra
  ];
}
