{ pkgs, ... }:
{
  programs.git.enable = true;
  programs.git.package = pkgs.git;
  programs.git.userName = "coast";
  programs.git.userEmail = "coasteen@proton.me";
}
