{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/gui/hyprland.nix    
    ../../modules/gui/waybar.nix    
  ];

  home.username = "averagelinuxenjoyer";
  home.homeDirectory = "/home/averagelinuxenjoyer";

  nixpkgs.config.allowUnfree = true;

  # dont
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    hyprpicker
    ungoogled-chromium
    discord
    firefox
    insomnia
    geeqie
    pavucontrol
    vlc
    teams-for-linux
    kitty
    slack
    qbittorrent
    rnote
    rofi-wayland
    obs-studio
    obs-studio-plugins.input-overlay
    steam
    steam-run
    wally-cli
    swww
    tor-browser-bundle-bin
    cliphist
    lazygit
    mongosh
    neofetch
    tldr
    ngrok
    phinger-cursors
  ];

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };
}
