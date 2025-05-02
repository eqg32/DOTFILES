(defun on-open ()
  (vterm)
  (evil-emacs-state 1))

(add-hook 'server-after-make-frame-hook 'on-open)
