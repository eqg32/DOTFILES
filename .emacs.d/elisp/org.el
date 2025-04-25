(defun setup-org ()
  (revert-buffer-quick)
  (variable-pitch-mode 1)
  (display-line-numbers-mode -1)
  (set-face-attribute 'org-code nil
		      :font "Iosevka Nerd Font"
		      :inherit 'fixed-pitch))

(add-hook 'org-mode-hook 'setup-org)
