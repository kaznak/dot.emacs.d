;;; 00.basic.el --- Basic Emacs Configurations

;; Character encoding
(set-language-environment "Japanese") ; This set conding system to EUC-JP
(prefer-coding-system 'utf-8-unix)

;; Key binding
(define-key global-map [?\M-¥] "\\")

;; behavior
(setq confirm-kill-emacs 'yes-or-no-p)

;; User Information
(setq user-full-name "Nakamura Kazutaka")
(setq user-mail-address "kaznak@gmail.com")

