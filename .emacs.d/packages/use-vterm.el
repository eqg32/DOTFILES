(use-package vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1))))
