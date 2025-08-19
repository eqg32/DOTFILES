(use-package format-all
  :ensure t
  :hook ((python-mode c-mode c++-mode) . format-all-mode)
  :config
  (setq-default format-all-formatters
		'(("Python" (black "--line-length=79"))
		  ("C" (astyle "--style=gnu"))
		  ("C++" (astyle "--style=gnu")))))
