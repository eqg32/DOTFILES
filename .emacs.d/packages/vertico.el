(use-package vertico
  :ensure t
  :custom (vertico-count 5)
  :init
  (icomplete-mode 0)
  :config
  (vertico-grid-mode 1)
  (vertico-mode 1))
