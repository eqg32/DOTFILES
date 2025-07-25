;; Macros:

(defmacro add-hooks (function &rest hooks)
  "Add FUNCTION to each of the HOOKS."
  `(dolist
       (hook (list ,@hooks))
     (add-hook hook ,function)))

(defmacro add-elements-to-list (list-var &rest elements)
  "Add ELEMENTS to LIST-VAR."
  `(dolist
       (element (list ,@elements))
     (add-to-list ',list-var element)))

;; Loading files:

(add-elements-to-list
 load-path
 (concat user-emacs-directory "lisp/emodal")
 (concat user-emacs-directory "lisp"))

(require 'emodal)
(require 'scripts)

(dolist (file (file-expand-wildcards
	       (concat user-emacs-directory "packages/use-*.el")))
  (when
      (file-exists-p file)
    (load file)))

;; Initialising package.el:

(require 'package)

(add-elements-to-list
 package-archives
 '("gnu" . "https://elpa.gnu.org/packages/")
 '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

;; Keyring:

(use-package gnu-elpa-keyring-update
  :ensure t)

;; Built-in packages:

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
  (mode-line-format
   '("%e" mode-line-front-space
     (:propertize
      ("" mode-line-mule-info
       mode-line-client
       mode-line-modified
       mode-line-remote
       mode-line-window-dedicated)
      display (min-width (6.0)))
     mode-line-frame-identification
     mode-line-buffer-identification
     " "
     mode-line-position
     " "
     (:eval (format-mode-line mode-name))
     " "
     mode-line-misc-info
     mode-line-end-spaces))
  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

(use-package autorevert
  :custom
  (auto-revert-interval 3)
  (auto-revert-verbose nil)
  :config (global-auto-revert-mode 1))

(use-package hl-line
  :hook (prog-mode . hl-line-mode))

(use-package calendar
  :custom
  (calendar-date-style 'european)
  (calendar-week-start-day 1))

(use-package display-line-numbers
  :hook
  (prog-mode . display-line-numbers-mode)
  :custom
  (display-line-numbers-type 'relative))

(use-package files
  :custom
  (confirm-kill-process nil)
  (create-lockfiles nil)
  (make-backup-files nil))

(use-package frame
  :custom
  (frame-resize-pixelwise t))

(use-package delsel
  :config (delete-selection-mode 1))

(use-package elec-pair
  :config (electric-pair-mode 1))

(use-package eglot
  :hook ((go-mode python-mode c-mode c++-mode) . eglot-ensure))

(use-package simple
  :hook ((prog-mode . column-number-mode)
	 ((prog-mode org-mode) . visual-line-mode))
  :custom
  (kill-whole-line t)
  (completion-show-help nil))

(use-package icomplete
  :config (icomplete-vertical-mode 1))

(use-package ibuffer
  :hook (ibuffer-mode . (lambda ()
			  (ibuffer-do-sort-by-major-mode)))
  :config (global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package flymake
  :custom
  (flymake-indicator-type 'margins))

(use-package org
  :custom
  (org-agenda-files '("~/ORG/notes.org" "~/ORG/todo.org")))

(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "cus.el")))
