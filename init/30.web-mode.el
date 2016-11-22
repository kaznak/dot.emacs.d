;;; 30.web-mode.el --- web-mode configuration

;;(require 'web-mode)
(autoload 'web-mode "web-mode")
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
