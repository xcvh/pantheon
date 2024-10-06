{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      q = "clear";
      cat = "bat";
      ms = "mas search";
      bs = "brew search";
    };
    # inspo: https://discourse.nixos.org/t/brew-not-on-path-on-m1-mac/26770/4
    initExtra = ''
      export NVM_DIR="/Users/xcvh/Library/Application Support/Herd/config/nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

      [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

      if [[ $(uname -m) == 'arm64' ]] && [[ $(uname -s) == 'Darwin' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
  };
}
