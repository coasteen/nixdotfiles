{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "amdgpu.ppfeaturemask=0xffffffff" ];
  boot.extraModulePackages = [ ];

  fileSystems."/".device = "/dev/disk/by-label/nixos";
  fileSystems."/".fsType = "ext4";

  fileSystems."/boot".device = "/dev/disk/by-label/boot";
  fileSystems."/boot".fsType = "vfat";
  fileSystems."/boot".option = [ "fmask=0022" "dmask=0022" ];

  fileSystems."/media/drive".device = "/dev/disk/by-uuid/facf5a78-8872-437c-4345-50a28c894aca";
  fileSystems."/media/drive".fsType = "btrfs";

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
