(defun user/on-open ()
  (vterm)
  (evil-emacs-state 1))

(add-hook 'server-after-make-frame-hook 'user/on-open)
