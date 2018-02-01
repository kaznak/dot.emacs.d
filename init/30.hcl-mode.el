;;; 30.hcl-mode.el --- Major mode for Hashicorp

;;(require 'hcl-mode)
(autoload 'hcl-mode "hcl-mode")
(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))
