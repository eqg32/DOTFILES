(use-package format-all
  :ensure t
  :hook ((python-mode c-mode c++-mode) . format-all-mode)
  :config
  (setq-default format-all-formatters
		'(("Python" (black "--line-length=79"))
		  ("C" (clang-format "--style=file"))
		  ("C++" (clang-format "--style=GNU")))))
