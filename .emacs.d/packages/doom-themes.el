(use-package doom-themes
  :ensure t
  :config
  (set-frame-parameter nil 'alpha-background 90)
  (set-face-attribute 'variable-pitch nil
		      :font "Iosevka Aile"
		      :height 140)
  (set-face-attribute 'default nil
		      :font "Iosevka Nerd Font"
		      :height 140)
  (load-theme 'doom-nord :no-confirm))
