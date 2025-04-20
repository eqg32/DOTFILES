(use-package elpy
  :ensure t
  :custom
  (elpy-test-runner 'elpy-test-pytest-runner)
  :config
  (elpy-enable))

(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode))
