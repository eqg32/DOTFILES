;;; emodal-functions.el --- Functions to use with emodal -*- lexical-binding: t; -*-

;;; Commentary:

;; Funtions that are used with emodal.

;;; Code:

(defun emodal-insert ()
  "Insert text."
  (interactive)
  (emodal-mode -1))

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
  (if
      (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-word))
  (emodal-mode -1))

(defun emodal-kill ()
  "Kill the region or word."
  (interactive)
  (if
      (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-word)))

(defun emodal-scroll-half-screen-up ()
  "Scroll half screen up."
  (interactive)
  (scroll-up-command (/ (window-body-height) 2)))

(defun emodal-save-line ()
  "Save whole line to the kill-ring."
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
