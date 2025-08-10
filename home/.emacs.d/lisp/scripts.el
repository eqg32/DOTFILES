;;; scripts.el --- User scripts -*- lexical-binding: t; -*-

;;; Commentary:

;; Just scripts that are used in the configuration

;;; Code:

;; C

(add-hooks
 (lambda ()
   "Settings for `c-mode' and other."
   (c-toggle-auto-newline 1)
   (c-set-style "gnu"))
 'c-mode-hook
 'c++-mode-hook
 'objc-mode-hook)

;; Emacs server client startup

(add-hooks 'ibuffer 'server-after-make-frame-hook)

;; Org-mode

(add-hooks
 (lambda ()
   "Settings for `org-mode'."
   (revert-buffer-quick)
   (display-line-numbers-mode -1)
   (company-mode -1)
   (variable-pitch-mode -1))
 'org-mode-hook)

;; Faces

(defun user/setup-faces ()
  "Set faces."
  (custom-set-faces
   '(default ((t :font "Iosevka Nerd Font" :height 140)))
   '(variable-pitch ((t :font "Iosevka Aile" :height 140)))
   '(fixed-pitch ((t :font "Iosevka Nerd Font" :height 140)))
   '(fixed-pitch-serif ((t :font "Iosevka Nerd Font" :height 140)))
   '(flymake-note ((t (:underline (:color foreground-color :style wave :position nil)))))
   '(flymake-warning ((t (:underline (:color foreground-color :style line :position nil)))))
   '(flymake-error ((t (:underline (:color foreground-color :style line :position nil))))) 
   '(org-level-1 ((t :height 1.4)))
   '(org-level-2 ((t :height 1.2)))
   '(org-code ((t :font "Iosevka Nerd Font" :inherit 'default))))
  (when
      (not (display-graphic-p))
    (custom-set-faces
     '(default ((t :background "unspecified-bg"))))))

(add-elements-to-list
 default-frame-alist
 '(internal-border-width . 12)
 '(alpha-background . 90))

(add-hooks
 'user/setup-faces
 'emacs-startup-hook
 'server-after-make-frame-hook)

(provide 'scripts)

;;; scripts.el ends here
