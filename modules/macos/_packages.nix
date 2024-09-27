{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "xcvh";
    mutableTaps = false;
    taps = {
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-core" = inputs.homebrew-core;
    };
  };

  homebrew = {
    enable = true;
    global = {
      autoUpdate = true;
    };
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    brews = [
      "trash"
    ];
    taps = builtins.attrNames config.nix-homebrew.taps;
    casks = [
      "affinity-photo"
      "cold-turkey-blocker"
      "devonthink"
      "deepl"
      "discord"
      "easyfind"
      "hazel"
      "hookmark"
      "karabiner-elements"
      "keyboard-maestro"
      "kiibohd-configurator"
      "mullvadvpn"
      "microsoft-remote-desktop"
      # "microsoft-outlook"
      "microsoft-teams"
      "popclip"
      "raycast"
      "receipts"
      "steam"
      "syncthing" # this should probably live in home-manager
      "tor-browser"
      "whatsapp"
      "zed"
    ];
    masApps = {
      "Drafts" = 1435957248;
      "Due" = 524373870;
      "OneDrive" = 823766827;
      "Tailscale" = 1475387142;
      "TextSniper" = 1528890965;
      "Things 3" = 904280696;
      "Neptunes" = 1006739057;
      "Outlook" = 985367838;
    };
  };
}
