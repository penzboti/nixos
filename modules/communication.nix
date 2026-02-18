{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    betterdiscordctl
    
    whatsapp-electron
    caprine # facebook messenger client
  ];
}
