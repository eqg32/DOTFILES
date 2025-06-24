(defun user/setup-frame ()
  (custom-set-faces
   '(default ((t :font "Iosevka Nerd Font" :height 140)))
   '(variable-pitch ((t :font "Iosevka Aile" :height 140)))
   '(fixed-pitch ((t :font "Iosevka Nerd Font" :height 140)))
   '(org-level-1 ((t :height 1.4)))
   '(org-level-2 ((t :height 1.2)))
   '(org-code ((t :font "Iosevka Nerd Font" :inherit 'default)))))

(add-to-list 'default-frame-alist '(internal-border-width . 12))
(add-to-list 'default-frame-alist '(alpha-background . 90))

(add-hook 'server-after-make-frame-hook 'user/setup-frame)
