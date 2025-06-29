(use-package format-all
  :ensure t
  :hook ((go-mode . format-all-mode)
	 (c-mode . format-all-mode))
  :config
  (setq-default format-all-formatters
		'(("Python" (black "--line-length=79"))
		  ("Go" (gofmt))
		  ("C" (clang-format "--style=GNU")))))
