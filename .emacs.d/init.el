;; initialising package.el

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)

(package-initialize)

;; loading files

(load (concat user-emacs-directory "core.el"))
(mapc (lambda (x) (load x))
      (file-expand-wildcards
       (concat user-emacs-directory "packages/use-*.el")))

(mapc (lambda (x) (add-to-list 'custom-theme-load-path x))
      (file-expand-wildcards
       (concat user-emacs-directory "themes/*")))

(mapc (lambda (x) (load x))
      (file-expand-wildcards
       (concat user-emacs-directory "elisp/*.el")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b"
     "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "7aa5eb0412ee93dfacdeb1fff906932c2fb1747b8c96063ac4d7c1dc461bc0e6"
     "664111db1521fe3351061dc87aea95fa98b3f244f4b830fbc048d39c3a8bc125"
     "47fcd823a849d7e527f582c9e7c6af2aecd5ff12e67a14da5d5fe69853a6f573"
     "0cfe3605eb3b101b633a0d7d019ad6feee9a1ed10e303cc4e613ee4433218a93"
     "7c340289e943a8e1fdd76152014b75a976912caaa93285d9ff9581641166221b"
     "edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09"
     default))
 '(package-selected-packages
   '(base16-theme dashboard dirvish eat eldoc-box elpy evil-avy
		  evil-collection evil-commentary ewal-doom-themes
		  ewal-spacemacs-themes format-all git-gutter-fringe
		  gnu-elpa-keyring-update go-mode impatient-mode
		  indent-bars key-chord ligature magit markdown-mode
		  mood-line nerd-icons org-evil org-modern pdf-tools
		  poly-markdown rainbow-delimiters rainbow-mode
		  solaire-mode theme-magic tsc vertico
		  yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
