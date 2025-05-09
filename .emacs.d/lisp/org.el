(defun user/setup-org ()
  (revert-buffer-quick)
  (display-line-numbers-mode -1)
  (company-mode -1)
  (variable-pitch-mode 1)
  (set-face-attribute 'org-code nil
		      :font "Iosevka Nerd Font"
		      :inherit 'default))

(add-hook 'org-mode-hook 'user/setup-org)
