{
  pkgs,
  ...
}:

let

  baseGroups = [
    "networkmanager"
    "wheel"
    "docker"
    "scanner"
    "lp"
    "kvm"
    "libvirtd"
  ];

in

{
  users.users.youva = {
    isNormalUser = true;
    description = "Youva";
    extraGroups = baseGroups ++ [ "audio" ];
    shell = pkgs.fish;
  };

  users.users.lucie = {
    isNormalUser = true;
    description = "Lucie";
    extraGroups = baseGroups ++ [];
    shell = pkgs.zsh;
  };
}
