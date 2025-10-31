(use-package evil-avy
  :ensure t
  :after evil
  :config
  (define-key evil-normal-state-map (kbd "s") 'evil-avy-goto-char-2-below)
  (define-key evil-normal-state-map (kbd "S") 'evil-avy-goto-char-2-above))
