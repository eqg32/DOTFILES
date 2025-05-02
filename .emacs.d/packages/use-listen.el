(use-package listen
  :ensure t
  :hook ((listen-queue-mode . evil-emacs-state)
	 (listen-library-mode . evil-emacs-state))
  :custom
  (listen-lighter-format "%s %a: %t (%r)%E"))
