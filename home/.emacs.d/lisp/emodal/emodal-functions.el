;;; emodal-functions.el --- Functions to use with emodal -*- lexical-binding: t; -*-

;;; Commentary:

;; Funtions that are used with emodal.

;;; Code:

(defun emodal-forward-char ()
  "Move char forward and deactivate mark."
  (interactive)
  (deactivate-mark)
  (forward-char))

(defun emodal-backward-char ()
  "Move char backward and deactivate mark."
  (interactive)
  (deactivate-mark)
  (backward-char))

(defun emodal-next-line ()
  "Move to the next line and deactivate mark."
  (interactive)
  (deactivate-mark)
  (forward-line))

(defun emodal-previous-line ()
  "Move to the previous line and deactivate mark."
  (interactive)
  (deactivate-mark)
  (forward-line -1))

(defun emodal-forward-word ()
  "Move word forward and mark the beginning."
  (interactive)
  (call-interactively 'set-mark-command)
  (forward-word))

(defun emodal-backward-word ()
  "Move word backward and mark the end."
  (interactive)
  (call-interactively 'set-mark-command)
  (backward-word))

(defun emodal-insert ()
  "Insert text."
  (interactive)
  (emodal-mode -1))

(defun emodal-append ()
  "Append text."
  (interactive)
  (forward-char)
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

(defun emodal-extend ()
  "Extend line selection."
  (interactive)
  (if
      (region-active-p)
      (progn
	(forward-line)
	(end-of-line)
	(forward-char 1))
    (progn
      (beginning-of-line)
      (call-interactively 'set-mark-command)
      (end-of-line))))

(defun emodal-deactivate-mark ()
  "Deactivate mark."
  (interactive)
  (deactivate-mark))

(defun emodal-save-line ()
  "Save line into kill ring."
  (interactive)
  (save-excursion
    (kill-ring-save
     (line-beginning-position)
     (line-end-position))))

(defun emodal-change-region ()
  "Kill the region and start inserting text."
  (interactive)
  (call-interactively 'kill-region)
  (indent-according-to-mode)
  (emodal-mode -1))

(defun emodal-scroll-half-screen-up ()
  "Scroll half screen up."
  (interactive)
  (scroll-up-command (/ (window-body-height) 2)))

(defun emodal-scroll-half-screen-down ()
  "Scroll half screen down."
  (interactive)
  (scroll-down-command (/ (window-body-height) 2)))

(provide 'emodal-functions)

;;; emodal-functions.el ends here
