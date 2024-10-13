{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/gui/hyprland.nix    
    ../../modules/gui/waybar.nix    
    ../../modules/gui/rofi.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "averagelinuxenjoyer";
    homeDirectory = "/home/averagelinuxenjoyer";
    # dont
    stateVersion = "24.05";

    packages = with pkgs; [
      hyprpicker
      hyprshot
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

    pointerCursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
    };

    sessionVariables = {
      EDITOR = "hx";
      HYPRSHOT_DIR = "${config.home.homeDirectory}/Screenshots";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };
}
