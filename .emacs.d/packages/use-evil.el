(use-package evil
  :ensure t
  :custom
  (evil-want-C-u-scroll t)
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode 1))
