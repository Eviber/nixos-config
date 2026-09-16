{
  users.users.homeserver-vm = {
    isSystemUser = true;
    group = "homeserver-vm";
    extraGroups = [ "kvm" ];
    home = "/var/lib/homeserver-vm/";
    createHome = false;
  };
  users.groups.homeserver-vm = {};

  systemd.services.homeserver-vm = {
    description = "Home server VM";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    unitConfig = {
      StartLimitIntervalSec = "5min";
      StartLimitBurst = 5;
   };

    serviceConfig = {
      ExecStart = "/var/lib/homeserver-vm/current/bin/run-homeserver-vm";
      Restart = "always";
      RestartSec = "5s";
      TimeoutStopSec = "30s";
      StateDirectory = "homeserver-vm";
      WorkingDirectory = "/var/lib/homeserver-vm";

      User = "homeserver-vm";
      Group = "homeserver-vm";

      ProtectSystem = "strict";
      ProtectHome = true;
      PrivateTmp = true;
      PrivateUsers = true;

      PrivateDevices = false; # kvm
      DevicePolicy = "closed";
      DeviceAllow = [
        "/dev/kvm rw"
        # "/dev/net/tun rw" # needed for tap networking
      ];

      RestrictAddressFamilies = [ "AF_UNIX" "AF_INET" "AF_INET6" ];
      # SocketBindDeny = "any"; # only if tap networking

      NoNewPrivileges = true;
      CapabilityBoundingSet = "";
      RestrictSUIDSGID = true;
      RestrictNamespaces = true;
      LockPersonality = true;
      RestrictRealtime = true;
      MemoryDenyWriteExecute = true; # if something breaks try to set this to false

      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectKernelLogs = true;
      ProtectClock = true;
      ProtectHostname = true;
      ProtectControlGroups = true;
      ProtectProc = "invisible";
      ProcSubset = "pid";

      PrivateIPC = true;
      PrivatePIDs = true;
      RemoveIPC = true;
      PrivateMounts = true;
      UMask = "0077";

      SystemCallFilter = [ "@system-service" "~@resources" "~@privileged" ]; # if something breaks try to remove the "~@resources"
      SystemCallErrorNumber = "EPERM";
      SystemCallArchitectures = "native";
    };
  };
}
