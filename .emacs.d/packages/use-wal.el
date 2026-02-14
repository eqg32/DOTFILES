(use-package ewal
  :ensure t)

(use-package ewal-spacemacs-themes
  :ensure t
  :after ewal
  :config
  (load-theme 'ewal-spacemacs-modern :no-confirm))
