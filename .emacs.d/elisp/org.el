(defun setup-org ()
  (revert-buffer-quick)
  (variable-pitch-mode 1)
  (display-line-numbers-mode -1)
  (company-mode -1)
  (set-face-attribute 'org-code nil
		      :font "Iosevka Nerd Font"
		      :inherit 'default))

(add-hook 'org-mode-hook 'setup-org)
