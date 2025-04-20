(use-package ewal
  :ensure t)

(use-package ewal-spacemacs-themes
  :ensure t
  :after ewal)
  ;; :config
  ;; (load-theme 'ewal-spacemacs-modern :no-confirm))

(use-package ewal-doom-themes
  :ensure t
  :after ewal
  :config
  (load-theme 'ewal-doom-one :no-confirm))
