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
      "arc"
      "affinity-photo"
      "cold-turkey-blocker"
      "clickup"
      "downie"
      "devonthink"
      "deepl"
      "discord"
      "easyfind"
      "forklift"
      "fujitsu-scansnap-home"
      "handbrake"
      "hazel"
      "herd"
      "hookmark"
      "karabiner-elements"
      "keyboard-maestro"
      "kiibohd-configurator"
      "mullvadvpn"
      "microsoft-remote-desktop"
      # "microsoft-outlook"
      "microsoft-teams"
      "ollama"
      "ollamac"
      "gitbutler"
      "github"
      "popclip"
      "phpstorm"
      "raycast"
      "receipts"
      "steam"
      "syncthing" # this should probably live in home-manager
      "tor-browser"
      "whatsapp"
      "vlc"
      "zed"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Drafts" = 1435957248;
      "Due" = 524373870;
      "Front and Center" = 1493996622;
      "OneDrive" = 823766827;
      # "Gestimer 2" = 2142808944;
      # "Stando" = 2134630863;
      # These Give the Error: Download request failed: The server gave an error during download: 500 Internal Server Error.
      "Tailscale" = 1475387142;
      "TextSniper" = 1528890965;
      "Things 3" = 904280696;
      "Neptunes" = 1006739057;
      "MultiMarkdown Composer 4" = 1275176220;
      "In Your Face" = 1476964367;
      "Outlook" = 985367838;
      "Whisper Transcription" = 1668083311;
    };
  };
}
