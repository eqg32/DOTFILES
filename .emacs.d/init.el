;; initialising package.el

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)

(package-initialize)

;; keyring

(use-package gnu-elpa-keyring-update
  :ensure t)

;; built-in packages

(use-package emacs
  :custom
  (ring-bell-function 'ignore)
  (warning-minimum-level :error)
  (byte-compile-warnings nil)
  (native-comp-async-report-warnings-errors nil)
  (scroll-margin 4)
  (inhibit-startup-screen t)
  (message-log-max nil)
  (initial-scratch-message nil)
  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

(use-package autorevert
  :custom
  (auto-revert-interval 3)
  (auto-revert-verbose nil)
  :config
  (global-auto-revert-mode 1))

(use-package hl-line
  :hook (prog-mode . hl-line-mode))

(use-package calendar
  :custom
  (calendar-date-style 'european)
  (calendar-week-start-day 1))

(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  :config
  (global-display-line-numbers-mode 1))

(use-package files
  :custom
  (confirm-kill-process nil)
  (create-lockfiles nil)
  (make-backup-files nil))

(use-package frame
  :custom
  (frame-resize-pixelwise t))

(use-package delsel
  :config
  (delete-selection-mode 1))

(use-package elec-pair
  :config
  (electric-pair-mode 1))

(use-package eglot
  :hook ((go-mode . eglot-ensure)
	 (python-mode . eglot-ensure)
	 (c-mode . eglot-ensure)))

(use-package simple
  :config
  (global-visual-line-mode 1))

(use-package icomplete
  :config
  (icomplete-vertical-mode 1))

(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package python
  :custom
  (python-shell-interpreter-args "-q"))

(use-package org
  :custom
 (org-agenda-files '("~/ORG/notes.org" "~/ORG/todo.org")))

;; loading files

(mapc (lambda (x) (load x))
      (file-expand-wildcards
       (concat user-emacs-directory "packages/use-*.el")))

(mapc (lambda (x) (add-to-list 'custom-theme-load-path x))
      (file-expand-wildcards
       (concat user-emacs-directory "themes/*")))

(mapc (lambda (x) (load x))
      (file-expand-wildcards
       (concat user-emacs-directory "lisp/*.el")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(bluetooth bui dired-hacks-utils eldoc-box elisp-refs elpy evil-avy
	       evil-collection evil-commentary ewal-doom-themes
	       ewal-spacemacs-themes flx format-all fzf
	       git-gutter-fringe gnu-elpa-keyring-update go-mode
	       indent-bars key-chord ligature listen lsp-docker
	       lsp-treemacs magit mood-line multi-vterm org-evil
	       org-modern outline-indent "pdf-tools" peep-dired
	       rainbow-delimiters solaire-mode vertico vterm
	       yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
