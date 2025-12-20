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
    kitty # needed for hyprland
  ];

  programs = {
    hyprland.enable = true;
  };
}
