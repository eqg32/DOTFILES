(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (company-idle-delay 0.1)
  (company-format-margin-function nil)
  (company-show-quick-access 'left)
  (company-tooltip-limit 8)
  (company-tooltip-offset-display 'lines)
  (company-tooltip-align-annotations t)
  :config
  (global-company-mode 1))
