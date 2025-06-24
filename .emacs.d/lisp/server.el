(defun user/on-open ()
  (ibuffer))

(add-hook 'server-after-make-frame-hook 'user/on-open)
