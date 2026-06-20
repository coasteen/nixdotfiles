{ pkgs, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.package = pkgs.waybar;
  programs.waybar.systemd.enable = false;
  programs.waybar.settings.mainBar.layer = "top";
  programs.waybar.settings.mainBar.position = "top";
  programs.waybar.settings.mainBar.spacing = "0";
  programs.waybar.settings.mainBar.height = 35;
  programs.waybar.settings.mainBar.border-radius = 25;
  programs.waybar.settings.mainBar.output = [ "HDMI-A-1" ];

  programs.waybar.settings.mainBar.modules-left = [ "niri/workspaces" ];
  programs.waybar.settings.mainBar.modules-center = [ "niri/window" ];
  programs.waybar.settings.mainBar.modules-right = [ "clock" ];

  programs.waybar.settings.mainBar."custom/distro-icon".format = "󱄅";
  programs.waybar.settings.mainBar."custom/distro-icon".tooltip = "false";
  programs.waybar.settings.mainBar."niri/workspaces".disable-scroll = true;
  programs.waybar.settings.mainBar."niri/workspaces".all-outputs = false;
  programs.waybar.settings.mainBar."niri/workspaces".on-click = "activate";
  programs.waybar.settings.mainBar."clock".format = "{:%I:%M %p • %a, %d/%m}";
  programs.waybar.settings.mainBar."clock".format-alt = "{:%A, %d %B %Y}";
  programs.waybar.settings.mainBar."clock".tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
  imports = [ ./style.nix ];
}
