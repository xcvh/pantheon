{pkgs, ...}: {
  imports = [
    ./_dock.nix
    ./_packages.nix
  ];

  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "@admin"
      ];
    };
  };

  programs.zsh.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  services = {
    nix-daemon.enable = true;
    tailscale.enable = true;
  };

  users.users.xcvh.home = "/Users/xcvh";

  system = {
    startup.chime = false;
    defaults = {
      loginwindow.LoginwindowText = "If lost, contact hi@jel.do";
      screencapture.location = "/Users/xcvh/Pictures/Screenshots";

      dock = {
        autohide = true;
        autohide-delay = 0.12;
        autohide-time-modifier = 0.5;
        show-recents = false;
        mru-spaces = false;
        tilesize = 32;
        wvous-br-corner = 4;
        wvous-bl-corner = 11;
        wvous-tr-corner = 5;
      };

      finder = {
        AppleShowAllExtensions = false;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
      };

      menuExtraClock = {
        ShowSeconds = false;
        Show24Hour = true;
        ShowAMPM = false;
      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        # AppleInterfaceStyle = "Dark";
        # inspo: https://apple.stackexchange.com/questions/261163/default-value-for-nsglobaldomain-initialkeyrepeat
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
      };
    };
  };

  local = {
    dock = {
      enable = true;
      entries = [
        {path = "/Applications/DEVONthink 3.app";}
        {path = "/Applications/Drafts.app";}
        {path = "/Applications/Safari.app";}
        {path = "/System/Applications/Messages.app";}
      ];
    };
  };

  system.activationScripts.Wallpaper.text = ''
    echo >&2 "Setting up wallpaper..."
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/Pro Black.heic"'
  '';

  system.stateVersion = 5;
}
