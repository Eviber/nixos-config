{
  pkgs,
  ...
}:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Add printer drivers
  services.printing.drivers = with pkgs; [
    epson-escpr
    epson-escpr2
  ];

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.epsonscan2 ];
  };

  # Enable autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
