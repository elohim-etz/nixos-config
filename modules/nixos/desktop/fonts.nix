{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cantarell-fonts
    noto-fonts
    noto-fonts-cjk-sans
    
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
