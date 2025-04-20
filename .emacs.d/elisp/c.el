(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd"))))
  ;; (add-to-list 'eglot-server-programs '(c-ts-mode . ("clangd"))))
