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
      # TODO: change the colors to better suit the shitty laptop display :)
      "LoginScreen.LoginArea.Avatar" = {
        shape = "square";
        # active-border-color = "#ffcfce";
      };
      "LoginScreen" = {
        background = "wallpaper_2.jpg";
      };
      "LockScreen" = {
        background = "wallpaper_2.jpg";
      };
    };
  };
}
