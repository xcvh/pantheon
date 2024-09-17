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
    #sessionVariables = lib.mkIf pkgs.stdenv.isDarwin {
    #  SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";
    #};
  };

  programs = {
    git = {
      enable = true;
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
