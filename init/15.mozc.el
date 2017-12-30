;;; 15.mozc.el --- Configuration of Mode-Line

(when (and
       (eq system-type 'gnu/linux)
       (eq window-system 'x)
       (require 'mozc) )
  (setq default-input-method "japanese-mozc")
  )
