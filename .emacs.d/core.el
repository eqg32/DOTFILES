;; native packages

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
  (org-agenda-files (directory-files-recursively "~/ORG/" "\\.org$"))
  :config
  (add-hook 'org-mode-hook (lambda () (org-indent-mode))))

;; third-party packages

(use-package gnu-elpa-keyring-update
  :ensure t)

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

(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (company-idle-delay 0.1)
  (company-format-margin-function nil)
  (company-show-quick-access 'left)
  (company-tooltip-limit 8)
  (company-tooltip-offset-display 'lines)
  (company-tooltip-align-annotations t)
  :config
  (global-company-mode 1))
