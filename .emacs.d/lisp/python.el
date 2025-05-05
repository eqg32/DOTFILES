(defun user/setup-python ()
  (elpy-mode 1)
  (indent-bars-mode 1)
  (format-all-mode 1))

(add-hook 'python-ts-mode-hook 'user/setup-python)
(add-hook 'python-mode-hook 'python-ts-mode)
(with-eval-after-load 'evil
  (add-hook 'inferior-python-mode-hook 'evil-emacs-state))
