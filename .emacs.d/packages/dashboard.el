(use-package dashboard
  :ensure t
  :custom
  (dashboard-items '((recents . 12)))
  (dashboard-startup-banner (concat user-emacs-directory "packages/title.txt"))
  (dashboard-banner-logo-title "what the hell?")
  :config
  (dashboard-setup-startup-hook))
