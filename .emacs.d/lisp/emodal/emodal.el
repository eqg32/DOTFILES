;;; emodal.el --- Modal editing for emacs -*- lexical-binding: t; -*-

;;; Commentary:

;; Modal editing package for Emacs.

;;; Code:

(require 'cl-lib)
(require 'emodal-functions)

(defvar emodal-mode-map (let
			    ((keymap (make-sparse-keymap)))
			  (suppress-keymap keymap t)
			  keymap)
  "Keymap for `emodal-mode'.")

(defvar emodal-active-modes nil
  "Major modes in which `emodal-mode' is to be activated.")

(defvar emodal-inactive-modes nil
  "Major modes in which `emodal-mode' is not to be activated.")

(define-minor-mode emodal-mode
  "Mode for modal editing in Emacs."
  :global nil
  :init-value nil
  :lighter "[EM]"
  :keymap emodal-mode-map
  (dolist
      (binding '("C-x C-y" "C-;" "<escape>"))
    (keymap-local-set
     binding
     (lambda ()
       "Activate `emodal-mode'."
       (interactive)
       (emodal-mode 1))))
  (if
      emodal-mode
      (progn
	(setq-local cursor-type 'box))
    (progn
      (setq-local cursor-type 'bar)
      (deactivate-mark))))

(defun emodal--keys-not-bound (keys)
  "Return `t' if KEYS are not bound. Otherwise `nil'."
  (catch 'result
    (progn
      (dolist
	  (key (string-to-list keys))
	(when
	    (keymap-local-lookup (char-to-string key))
	  (throw 'result nil)))
      (throw 'result t))))

(defun emodal--activate-or-setup-moves ()
  "If `emodal-mode' is to be activated in current buffer's
major mode, activate it. Else, if `hjkl' or `jk' keys are not bound, bind them as
movement keys. Else do nothing."
  (cond
   ((minibufferp))
   ((cl-intersection
     (derived-mode-all-parents major-mode)
     emodal-active-modes)
    (emodal-mode 1))
   ((cl-intersection
     (derived-mode-all-parents major-mode)
     emodal-inactive-modes))))

(define-global-minor-mode emodal-global-mode
  emodal-mode
  emodal--activate-or-setup-moves)

(defun emodal-setup (bindings)
  "Setup BINDINGS for `emodal-mode'."
  (mapc
   (lambda (binding)
     "Bind BINDING to `emodal-mode'."
     (define-key emodal-mode-map (car binding) (cdr binding)))
   bindings))

(emodal-setup '(("h" . backward-char)
		("j" . next-line)
		("k" . previous-line)
		("l" . forward-char)

		("e" . forward-word)
		("b" . backward-word)

		("H" . beginning-of-line)
		("J" . end-of-buffer)
		("K" . beginning-of-buffer)
		("L" . end-of-line)
		("m" . emodal-scroll-half-screen-up)
		("q" . emodal-scroll-half-screen-down)
		("]" . scroll-up-line)
		("[" . scroll-down-line)

		("d" . emodal-kill)
		("c" . emodal-change)
		("y" . kill-ring-save)
		("Y" . emodal-save-line)
		("p" . yank)
		("P" . yank-from-kill-ring)
		("o" . emodal-open-above)
		("O" . emodal-open-below)
		("S" . surround-region)

		("u" . undo)
		("r" . undo-redo)

		("v" . set-mark-command)
		("w" . emodal-mark-line)
		("s" . exchange-point-and-mark)
		("a" . keyboard-quit)

		("i" . emodal-insert)
		("t" . join-line)))

(setq emodal-active-modes '(prog-mode text-mode conf-mode))
(setq emodal-inactive-modes '(fundamental-mode comint-mode))

(emodal-global-mode 1)

(provide 'emodal)

;;; emodal.el ends here
