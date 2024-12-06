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
      "anki"
      "affinity-photo"
      "cold-turkey-blocker"
      "clickup"
      "chatgpt"
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
      "keka"
      "karabiner-elements"
      "keyboard-maestro"
      "kiibohd-configurator"
      "mullvadvpn"
      "microsoft-remote-desktop"
      "microsoft-teams"
      "numi"
      "ollama"
      "ollamac"
      "gitbutler"
      "github"
      "popclip"
      "phpstorm"
      "raycast"
      "receipts"
      "steam"
      "font-sudo"
      "font-scientifica"
      "font-cozette"
      "syncthing" # this should probably live in home-manager
      "whatsapp"
      "vlc"
      "zed"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Drafts" = 1435957248;
      "Due" = 524373870;
      "ColorSlurp" = 1287239339;
      "Front and Center" = 1493996622;
      "OneDrive" = 823766827;
      "Tailscale" = 1475387142;
      "TextSniper" = 1528890965;
      "Things 3" = 904280696;
      "Neptunes" = 1006739057;
      "Slack" = 803453959;
      "MultiMarkdown Composer 4" = 1275176220;
      "In Your Face" = 1476964367;
      "Whisper Transcription" = 1668083311;
    };
  };
}
