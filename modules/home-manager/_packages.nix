{
  pkgs,
  osConfig,
  ...
}: {
  home = {
    packages = with pkgs;
      [
        bat
        ffmpeg
        pandoc
        exiftool
        poppler_utils
        qrencode
        tree
        yt-dlp
        alejandra
        just
        nixd
        perlnavigator
        nixos-rebuild # needed for macOS
        sops
      ]
      # Below packages are for development and therefore excluded from servers
      # inspo: https://discourse.nixos.org/t/how-to-use-hostname-in-a-path/42612/3
      ++ (
        if builtins.substring 0 3 osConfig.networking.hostName != "svr"
        then []
        else []
      );
  };
}
