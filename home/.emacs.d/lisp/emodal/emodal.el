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
  :lighter "[EMODAL]"
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
      (setq-local cursor-type 'box)
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
     emodal-inactive-modes))
   ((emodal--keys-not-bound "hjkl")
    (progn
      (keymap-local-set "h" 'backward-char)
      (keymap-local-set "j" 'next-line)
      (keymap-local-set "k" 'previous-line)
      (keymap-local-set "l" 'forward-char)))
   ((emodal--keys-not-bound "jk")
    (progn
      (keymap-local-set "j" 'next-line)
      (keymap-local-set "k" 'previous-line)))))

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

(emodal-setup '(("h" . emodal-backward-char)
		("j" . emodal-next-line)
		("k" . emodal-previous-line)
		("l" . emodal-forward-char)
		("e" . emodal-forward-word)
		("b" . emodal-backward-word)
		("H" . backward-char)
		("J" . next-line)
		("K" . previous-line)
		("L" . forward-char)
		("E" . forward-word)
		("B" . backward-word)
		("w" . exchange-point-and-mark)
		("u" . undo)
		("U" . undo-redo)
		("o" . emodal-open-above)
		("O" . emodal-open-below)
		("v" . set-mark-command)
		("V" . join-line)
		("n" . emodal-deactivate-mark)
		("x" . emodal-extend)
		("X" . execute-extended-command)
		("y" . kill-ring-save)
		("Y" . emodal-save-line)
		("p" . yank)
		("P" . yank-pop)
		("d" . kill-region)
		("D" . delete-region)
		("c" . emodal-change-region)
		("g" . beginning-of-buffer)
		("G" . end-of-buffer)
		(";" . emodal-scroll-half-screen-up)
		(":" . emodal-scroll-half-screen-down)
		("i" . emodal-insert)
		("a" . keyboard-quit)
		("I" . beginning-of-line)
		("A" . end-of-line)
		("s" . isearch-forward)
		("S" . isearch-backward)
		("q" . xref-find-definitions)
		("Q" . xref-find-references)))

(setq emodal-active-modes '(prog-mode text-mode conf-mode))
(setq emodal-inactive-modes '(fundamental-mode comint-mode))

(emodal-global-mode 1)

(provide 'emodal)

;;; emodal.el ends here
