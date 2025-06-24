(defun confirm-yes-or-no-p (prompt) t)
(defun confirm-y-or-n-p (prompt) t)

(advice-add 'yes-or-no-p :override #'confirm-yes-or-no-p)
(advice-add 'y-or-n-p :override #'confirm-y-or-n-p)
