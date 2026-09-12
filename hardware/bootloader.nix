{
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        # edk2-uefi-shell.enable = true;
        enable = true;
        windows."windows".efiDeviceHandle = "FS2";
        configurationLimit = 5;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "exfat" ];
  };
}
