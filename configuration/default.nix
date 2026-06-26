{ lib, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ./services/jellyfin/jellyfin.nix
  ];

  nixpkgs.overlays = [
    (final: prev: {
      inherit (prev.lixPackageSets.stable) nixpkgs-review nix-eval-jobs nix-fast-build colmena;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.compressor = "zstd";
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.configurationLimit = 25;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/media/drive".device = "/dev/disk/by-uuid/facf5a78-8872-437c-4345-50a28c894aca";
  fileSystems."/media/drive".fsType = "btrfs";

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  networking.hostName = "unix";
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 2080 ];

  time.timeZone = "Asia/Tehran";

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
  services.printing.enable = false;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.libinput.enable = true;
  services.flatpak.enable = true;
  services.openssh.enable = true;

  programs.niri.enable = true;
  programs.niri.useNautilus = true;
  programs.niri.package = pkgs.niri;
  programs.hyprland.enable = true;
  programs.hyprland.package = pkgs.hyprland;
  programs.nano.enable = false;
  programs.firefox.enable = true;
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;
  programs.nix-ld.enable = true;
  programs.appimage.enable = true;
  programs.nm-applet.enable = true;
  programs.neovim.enable = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.steam.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.interactiveShellInit = ''
    zmodload zsh/zprof
    autoload -Uz compinit
    if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    	compinit
    else
    	compinit -C
    fi
    source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  '';

  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  virtualisation.docker.enable = true;

  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stable
    wget
    adwaita-icon-theme
    rofi
    iptables
    mesa-demos
    wl-clipboard
    wireguard-tools
  ];

  users.users.coast.isNormalUser = true;
  users.users.coast.extraGroups = [ "wheel" "docker" "input" "video" "audio" "usb" ];
  users.users.coast.shell = pkgs.zsh;

  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [
    {
      users = [ "coast" ];
      keepEnv = true;
      persist = true;
    }
  ];
  security.polkit.enable = true;

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
