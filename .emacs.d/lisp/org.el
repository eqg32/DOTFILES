(defun user/setup-org ()
  (revert-buffer-quick)
  (display-line-numbers-mode -1)
  (company-mode -1)
  (variable-pitch-mode -1))

(add-hook 'org-mode-hook 'user/setup-org)
