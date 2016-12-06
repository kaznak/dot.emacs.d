;;; 10.display-time.el --- Display Datetime on Emacs Mode-Line

(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)) )
(display-time)
