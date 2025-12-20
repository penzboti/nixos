{ silentSDDM, pkgs, ...}:
let
  # this is a workaround, because
  # wallpaper paths didn't want to build
  # and profile icon paths didn't work before login (so only work on test)
  # so the solution is to move to the nix store
  # which we can do by making a derivation
  # this derivation is the entire images folder
  # partially made by chatgpt
  src = builtins.path {
    path = ../images;
    name = "images";
  };
  dv = pkgs.stdenv.mkDerivation {
    pname = "images";
    version = "0.0";
    inherit src;

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
  col = "#910106";
  # col = "#ffcfce"; # original color
in
{
  imports = [silentSDDM.nixosModules.default];
  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      wallpaper = "${dv}/wallpaper_2.jpg";
    };
    profileIcons = {
     penzboti = "${dv}/pfp.jpg";
    };
    settings = {
      "LockScreen" = {
        background = "wallpaper_2.jpg";
      };
      "LockScreen.Clock" = {
        color = col;
      };
      "LockScreen.Date" = {
        color = col;
      };
      "LoginScreen" = {
        background = "wallpaper_2.jpg";
      };
      "LoginScreen.LoginArea.Avatar" = {
        shape = "square";
        active-border-color = col;
      };
      "LoginScreen.LoginArea.Username" = {
        color = col;
      };
      "LoginScreen.LoginArea.PasswordInput" = {
        background-color = col;
        border-color = col;
        content-color = col;
      };
      "LoginScreen.LoginArea.Spinner" = {
        color = col;
      };
    };
  };
}
