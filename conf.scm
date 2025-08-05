(use-modules (gnu services)
	     (gnu home services)
	     (gnu home services dotfiles)
	     (gnu packages)
	     (gnu packages emacs)
	     (gnu packages terminals)
     	     (gnu packages wm) (gnu packages linux) (gnu packages rust-apps) (gnu packages xdisorg) (gnu packages python-xyz)
	     (gnu packages mpd) (gnu packages pulseaudio))

(home-environment
 (packages
  (list
   emacs-pgtk
   kitty
   swayfx i3status-rust bemenu i3-autotiling
   grimshot wl-clipboard
   brightnessctl
   mpd mpd-mpc pulseaudio pulsemixer))
 (services
  (list
   (service home-dotfiles-service-type
	    (home-dotfiles-configuration
	     (directories '("./home")))))))
