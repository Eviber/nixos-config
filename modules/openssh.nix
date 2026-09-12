{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
    extraConfig = "MaxAuthTries 3 \n PerSourcePenalties crash:3600s authfail:3600s max:86400s";
  };
}
