{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rofi # application opener
    waybar # system bar
    hyprpaper # wallpaper
    wl-clipboard-rs # for terminal clipboard
    hyprshot # screenshot tool
    hyprlock # lockscreen (while in session)
    udiskie # automount external storage devices TODO: need hyprland start
  ];
  programs = {
    hyprland.enable = true;
  }
}
