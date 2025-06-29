(defun user/setup-python ()
  (indent-bars-mode 1)
  (format-all-mode 1))

(add-hook 'python-mode-hook 'user/setup-python)
(with-eval-after-load 'evil
  (add-hook 'inferior-python-mode-hook 'evil-emacs-state))
