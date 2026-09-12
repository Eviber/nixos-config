{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware
    ./modules
  ];

  system.nixos.label = "cleanup";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Probably not needed?
  programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Nix tooling
    nh
    nps  # Cache the nix package list, query and sort by relevance
    nixfmt-rs # nix formatter
    statix # nix static analyzer
    nixd # nix language server

    # CLI fundamentals
    wget
    sshpass
    git
    bat
    zoxide
    socat
    unzip
    jq
    tree-sitter
    fzf
    ripgrep
    fd

    # Terminal emulator & file manager
    kitty
    yazi

    # Media & document format tools
    ffmpeg
    imagemagick
    poppler
    resvg
    chafa # ascii image rendering

    # Development
    gcc
    cmake
    gnumake
    nodejs
    lua-language-server
    bob-nvim

    # Hyprland / Wayland desktop
    hyprland
    hyprshutdown
    hyprpolkitagent # elevated rights popups
    hyprls
    wofi # launcher
    hyprlauncher
    walker
    waybar # status bar
    ashell
    wayle
    playerctl # media control
    dunst # notifications
    wl-clipboard # clipboard
    udiskie # auto mount drives
    hyprsunset # blue light filter

    # System & disk utilities
    pavucontrol
    gparted
    bluetui
    overskride # bluetooth gui
    impala # iwd (wifi) tui

    # Imaging & capture devices
    gimp
    epsonscan2
    v4l-utils # Webcam config

    # Pipewire
    pipewire
    pipewire-control-center
    pipewire.jack
    helvum
    pwvucontrol
    coppwr

    # Audio production
    ardour
    zynaddsubfx
    lmms
    carla

    # Audio plugins
    calf
    lsp-plugins

    # Media playback
    mpv
    clock-rs # ascii clock

    # Communication
    discord
    signal-desktop

    # Browser & downloads
    google-chrome
    qbittorrent
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
