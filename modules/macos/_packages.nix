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
      "devonthink"
      "discord"
      "hazel"
      "hookmark"
      "karabiner-elements"
      "keyboard-maestro"
      "kiibohd-configurator"
      "mullvadvpn"
      "microsoft-remote-desktop"
      "popclip"
      "raycast"
      "steam"
      "tor-browser"
      "zed"
    ];
    masApps = {
      "OneDrive" = 823766827;
      "Tailscale" = 1475387142;
      "Neptunes" = 1006739057;
    };
  };
}
