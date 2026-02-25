;;; emodal-functions.el --- Functions to use with emodal -*- lexical-binding: t; -*-

;;; Commentary:

;; Funtions that are used with emodal.

;;; Code:

(defun emodal--maybe-deactivate-region ()
  "Deactivate region if `emodal--temp-region' is t."
  (when emodal--temp-region
    (setq emodal--temp-region nil)
    (deactivate-mark)))

(defun emodal-backward-char ()
  "Backward char."
  (interactive)
  (emodal--maybe-deactivate-region)
  (backward-char))

(defun emodal-next-line ()
  "Next line."
  (interactive)
  (emodal--maybe-deactivate-region)
  (next-line))

(defun emodal-previous-line ()
  "Previous line."
  (interactive)
  (emodal--maybe-deactivate-region)
  (previous-line))

(defun emodal-forward-char ()
  "Forward char."
  (interactive)
  (emodal--maybe-deactivate-region)
  (forward-char))

(defun emodal-forward-word ()
  "Forward word."
  (interactive)
  (unless (and (region-active-p) (not emodal--temp-region))
    (setq emodal--temp-region t)
    (call-interactively 'set-mark-command))
  (forward-word))

(defun emodal-backward-word ()
  "Forward word."
  (interactive)
  (unless (and (region-active-p) (not emodal--temp-region))
    (setq emodal--temp-region t)
    (call-interactively 'set-mark-command))
  (backward-word))

(defun emodal-keyboard-quit ()
  "Keyboard quit."
  (interactive)
  (setq emodal--temp-region nil)
  (keyboard-quit))

(defun emodal-set-mark-command ()
  "`set-mark-command' if region is inactive.
Otherwise set `emodal--temp-region' to nil."
  (interactive)
  (if emodal--temp-region
      (setq emodal--temp-region nil)
    (call-interactively 'set-mark-command)))

(defun emodal-insert ()
  "Insert text."
  (interactive)
  (emodal-mode -1))

(defun emodal-kill ()
  "Kill the region or word."
  (interactive)
  (if
      (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'delete-char)))

(defun emodal-open-above ()
  "Open line below."
  (interactive)
  (end-of-line)
  (newline))

(defun emodal-open-below ()
  "Open line above."
  (interactive)
  (beginning-of-line)
  (open-line 1))

(defun emodal-change ()
  "Kill the region or word and start inserting text."
  (interactive)
  (emodal-kill)
  (emodal-mode -1))

(defun emodal-change-line ()
  "Kill the region or word and start inserting text."
  (interactive)
  (kill-whole-line)
  (emodal-open-below)
  (emodal-mode -1))

(defun emodal-scroll-half-screen-up ()
  "Scroll half screen up."
  (interactive)
  (scroll-up-command (/ (window-body-height) 2)))

(defun emodal-save-line ()
  "Save whole line to the `kill-ring'."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position)))

(defun emodal-scroll-half-screen-down ()
  "Scroll half screen down."
  (interactive)
  (scroll-down-command (/ (window-body-height) 2)))

(defun emodal-mark-line ()
  "Mark whole line or extend the selection."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (unless (region-active-p)
      (call-interactively 'set-mark-command))
    (end-of-line))
  (forward-line))

(provide 'emodal-functions)

;;; emodal-functions.el ends here
