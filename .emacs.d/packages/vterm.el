(use-package vterm
  :ensure t
  :hook (vterm-mode . (lambda ()
			(setq-local evil-move-cursor-back nil
				    evil-insert-state-cursor 'box)
			(display-line-numbers-mode -1))))
