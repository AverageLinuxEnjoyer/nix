{ config, pkgs, inputs, ... }:

{
  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
      patches = (oa.patches or []) ++ [
        (pkgs.fetchpatch {
          name = "fix waybar hyprctl";
          url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
          sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
        })
      ];
    });

    style = builtins.readFile ./waybar.css;

    settings = {
      topBar = {
        layer = "top";
        position = "top";

        modules-left = [ "clock" "hyprland/workspaces" "custom/arch" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "memory" "cpu" "temperature" "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

        "custom/arch" = {
          format = "  ";
          tooltip = false;
          on-click = "sh $HOME/.config/rofi/bin/powermenu";
        };

        "hyprland/workspaces" = {
          # format = "{name}";
          format = "{icon}";
          tooltip = false;
          all-outputs = true;
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "92" = "10";
            active = "";
            default = "";
          };
        };

        "hyprland/window" = {
          format = "{}";
        };

        clock = {
        	format = "{:%A, %B %d, %Y (%R)}  ";
        	tooltip-format = "<tt><small>{calendar}</small></tt>";
        	calendar = {
        		mode           = "year";
        		mode-mon-col   = 3;
        		weeks-pos      = "right";
        		on-scroll      = 1;
        		on-click-right = "mode";
        		format = {
        			months   = "<span color='#ffead3'><b>{}</b></span>";
        			days     = "<span color='#ecc6d9'><b>{}</b></span>";
        			weeks    = "<span color='#99ffdd'><b>W{}</b></span>";
        			weekdays = "<span color='#ffcc66'><b>{}</b></span>";
        			today    = "span color='#ff6699'><b><u>{}</u></b></span>";
        		};
        	};
        	actions = {
        		on-click-right = "mode";
        		on-click-forward = "tz_up";
        		on-click-backward = "tz_down";
        		on-scroll-up = "shift_up";
        		on-scroll-down = "shift_down";
        	};
        };

        temperature = {
          thermal-zone = 1;
          hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C ";
          format = "{temperatureC}°C ";
          interval = 2;
        };

        memory = {
          interval = 1;
          format = "memory {percentage}%";
          states = {
            warning = 85;
          };
        };

        cpu = {
          interval = 1;
          format = "cpu {usage}%";
        };

        backlight = {
          device = "intel_backlight";
          format = "<span color='#b4befe'>{icon}</span> {percent}%";
          format-icons = [ "" ];
        };

        pulseaudio = {
          format = "<span color='#b4befe'>{icon}</span> {volume}%";
          format-muted = " Muted";
          tooltip = false;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          scroll-step = 1;
        };

        bluetooth = {
          format = "<span color='#b4befe'></span> {status}";
          format-disabled = "";
          format-connected = "<span color='#b4befe'></span> {num_connections}";
          tooltip-format = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}   {device_address}";
        };

        network = {
          interface = "wlp2s0";
          format = "{ifname}";
          format-wifi = "<span color='#b4befe'> </span>{essid}";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
          tooltip = false;
        };

        battery = {
          format = "<span color='#b4befe'>{icon}</span> {capacity}%";
          format-icons = [ "" "" "" ];
          format-charging = "<span color='#b4befe'></span> {capacity}%";
          tooltip = true;
        };
      };
    };
  };
}
