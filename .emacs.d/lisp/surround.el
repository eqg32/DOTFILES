;;; surround.el --- Surround a region with.

;;; Commentary:

;; Surround a region with a chosen character.

;;; Code:

(defvar surround--pairs
  '(("\"" . "\"")
    ("'" . "'")
    ("<" . ">")
    ("(" . ")")
    ("[" . "]")
    ("{" . "}"))
  "The alist of pairs.")

(defun surround-region (pair)
  "Surround the region, if active.
PAIR is a character used for surrounding."

  (interactive "sSurround pair: ")
  (when (region-active-p)
    (let ((beginning (region-beginning))
	  (end (+ 1 (region-end)))
	  (op-pair (if (assoc-string pair surround--pairs)
		       (car (assoc-string pair surround--pairs))
		     nil))
	  (cl-pair (if (assoc-string pair surround--pairs)
		       (cdr (assoc-string pair surround--pairs))
		     nil)))
      (save-excursion
	(goto-char beginning)
	(unless op-pair
	  (setq op-pair pair
		cl-pair pair))
	(insert op-pair)
	(goto-char end)
	(insert cl-pair)))))

(provide 'surround)

;;; surround.el ends here
