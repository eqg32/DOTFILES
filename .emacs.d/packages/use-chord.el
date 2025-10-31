(use-package key-chord
  :ensure t
  :after evil
  :config
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))
