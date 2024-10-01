{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./_packages.nix
    ./_zsh.nix
  ];

  home = {
    username = "xcvh";
    homeDirectory = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux "/home/xcvh")
      (lib.mkIf pkgs.stdenv.isDarwin "/Users/xcvh")
    ];
    stateVersion = "23.11";
    sessionPath = [
      (lib.mkIf pkgs.stdenv.isDarwin "$HOME/Library/Application Support/Herd/bin")
    ];
    #sessionVariables = lib.mkIf pkgs.stdenv.isDarwin {
    #  SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";
    #};
  };

  programs = {
    git = {
      enable = true;
      ignores = [
        # General
        ".DS_Store"
        ".AppleDouble"
        ".LSOverride"

        # Icon must end with two \r
        "Icon"

        # Thumbnails
        "._*"

        # Files that might appear in the root of a volume
        ".DocumentRevisions-V100"
        ".fseventsd"
        ".Spotlight-V100"
        ".TemporaryItems"
        ".Trashes"
        ".VolumeIcon.icns"
        ".com.apple.timemachine.donotpresent"

        # Directories potentially created on remote AFP share
        ".AppleDB"
        ".AppleDesktop"
        "Network Trash Folder"
        "Temporary Items"
        ".apdisk"
          ];
      # delta = {
      #   enable = true;
      # };
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    fastfetch.enable = true;
  };

  # Nicely reload system units when changing configs
  # Self-note: nix-darwin seems to luckily ignore this setting
  systemd.user.startServices = "sd-switch";
}
