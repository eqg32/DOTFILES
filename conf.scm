(use-modules (gnu services)
	     (gnu home services)
	     (gnu home services dotfiles)
	     (gnu packages))

(home-environment
 (packages
  (specifications->packages
   '("emacs-no-x"
     "alacritty"
     "swayfx" "i3status-rust" "bemenu" "i3-autotiling"
     "grimshot" "wl-clipboard"
     "brightnessctl"
     "mpd" "mpd-mpc" "pulseaudio" "pulsemixer")))
 (services
  (list
   (service home-dotfiles-service-type
	    (home-dotfiles-configuration
	     (directories '("./home")))))))
