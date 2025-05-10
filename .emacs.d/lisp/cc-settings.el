(defun user/setup-c ()
  (c-toggle-auto-newline 1)
  (c-set-style "gnu"))

(add-hook 'c-mode-hook 'user/setup-c)
