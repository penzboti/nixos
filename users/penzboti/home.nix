{ config, pkgs, ... }:
{
  home.stateVersion = "24.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES

  home.username = "penzboti";
  home.homeDirectory = "/home/penzboti";

  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "mpv" ''
      celluloid
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  xdg.configFile = {
    "gtk-3.0/settings.ini".force = true;
    "gtk-4.0/settings.ini".force = true;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'.
  home.sessionVariables = {
    EDITOR = "hx";
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    # theme = {
    #   name = "Kanagawa-BL";
    #   package = pkgs.kanagawa-gtk-theme;
    # };
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    font = {
      name = "JetbrainsMono";
      package = pkgs.jetbrains-mono;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
