{
  fileSystems."/mnt/warehouse" = {
    device = "/dev/disk/by-uuid/534B8B664998301D";
    fsType = "ntfs3";
    options = [
      "uid=1000"
      "gid=100"
      # "umask=022"
      "nofail"
    ];
  };
}
