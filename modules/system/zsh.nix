{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
  ];
  
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
    };
    histSize = 10000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

}
