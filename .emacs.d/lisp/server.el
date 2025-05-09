(defun user/on-open ()
  (vterm))

(add-hook 'server-after-make-frame-hook 'user/on-open)
