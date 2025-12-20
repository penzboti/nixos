# info
initial flake config from https://github.com/vimjoyer/flake-starter-config
modularised nixos setup without using home-manager.
made with https://nixos-and-flakes.thiscute.world/ and https://github.com/ryan4yin/nix-config/tree/i3-kickstarter

# for new systems
[new-system.md](./docs/new-system.md)

# todo
- home-manager setup? (& nix develop);
### side note
i put all the .config files into a separate repo;
this is good for cross-platform apps to sync between windows/linux;
but also good if i switch off of nixos + i don't have to rewrite them in home manager
#### here are some links
- if i ever decide otherwise:
https://github.com/bevyengine/bevy/blob/main/docs/linux_dependencies.md
https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/
https://github.com/fufexan/dotfiles
https://github.com/nix-community/home-manager

# manually installed
- rofi style -> flake that (idk how i even did this)
- swaync style -> flake that (i might know how i did this)
- other .config files are in separate repos
### side note 1
you can't just use the latest github commit every nixos build;
you have to manually copy the hash of the commit you wanna use;
some guy said to use --impure flag or whatever;
if that doesn't cause problems, i could include config files automatically on new installs;
they wouldn't really be useful afterwards, and that is expected
### side note 2
these 'flake-that' things are made every nixos build.
so then i can't edit them?
or i can edit them just dont rebuild the system then push to github and THEN rebuild the system.
that seems to be the most straightforward.
## with GNOME-TWEAKS
- bibata cursors
- thunar theme
