(when (or (memq 'ewal-doom-one custom-enabled-themes)
	  (memq 'ewal-doom-vibrant custom-enabled-themes))
  (set-face-attribute 'company-tooltip nil
		      :foreground (face-attribute 'font-lock-comment-face :foreground))
  (set-face-attribute 'company-tooltip-selection nil
		      :foreground (face-attribute 'company-tooltip-common :foreground)
		      :background (face-attribute 'default :background))
  (set-face-attribute 'line-number nil :foreground (face-attribute 'font-lock-comment-face :foreground)))

(set-frame-parameter nil 'alpha-background 90)

(set-face-attribute 'variable-pitch nil :font "Iosevka Aile" :height 130)

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 130)

(with-eval-after-load 'org
  (set-face-attribute 'org-level-1 nil :height 1.4)
  (set-face-attribute 'org-level-2 nil :height 1.2))
