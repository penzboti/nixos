# info
modularised nixos setup.
using https://nixos-and-flakes.thiscute.world/
and https://github.com/ryan4yin/nix-config/tree/i3-kickstarter

# for new systems
[[new-system.md](./docs/new-system.md)]

# todo
- full home-manager setup (& nix develop); [this](https://github.com/bevyengine/bevy/blob/main/docs/linux_dependencies.md) might help
https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/
https://github.com/fufexan/dotfiles
https://github.com/nix-community/home-manager
    - not zed bc of cross platform compatibility
    - full hyprland
# manually installed
- waybar config -> flake that
- rofi style -> flake that (idk how i even did this)
- swaync style -> flake that (i might know how i did this)
- hyprlock style -> flake that
- cross platform configs in separate repo: nvim, ..
- oh my posh theme -> i think you can apply it in conf.nix
### side note
these 'flake-that' things are made every nixos build.
so then i can't edit them?
or i can edit them just dont rebuild the system then push to github and THEN rebuild the system.
that seems to be the most straightforward.
## with GNOME-TWEAKS
- bibata cursors
- thunar theme
