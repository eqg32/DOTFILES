(defun setup-python ()
  (elpy-mode 1)
  (indent-bars-mode 1)
  (format-all-mode 1))

(add-hook 'python-ts-mode-hook 'setup-python)
(add-hook 'python-mode-hook 'python-ts-mode)
