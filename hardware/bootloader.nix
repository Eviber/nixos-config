{
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      limine = {
        enable = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "exfat" ];
  };
}
