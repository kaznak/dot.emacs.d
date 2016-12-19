;;; 10.mode-line.el --- Configuration of Mode-Line

;; show line and column number
(line-number-mode t)
(column-number-mode t)

;; show datetime
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)) )
(display-time)
