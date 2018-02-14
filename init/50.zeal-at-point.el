;;; 50.zeal-at-point.el --- Search the word at point with Zeal
;;; https://github.com/jinzhu/zeal-at-point

(autoload 'zeal-at-point "zeal-at-point")

(global-set-key "\C-cd" 'zeal-at-point)

;; ;; narrow down with a docset prefix
;; (add-to-list 'zeal-at-point-mode-alist '(perl-mode . "perl"))
;; ;; ;; Use multiple docsets
;; (add-to-list 'zeal-at-point-mode-alist '(python-mode . ("python" "django")))

;; ;; set buffer local zeal-at-point-docset
;; (add-hook 'rinari-minor-mode-hook
;;    (lambda () (setq zeal-at-point-docset "rails")))
;; ;; ;; Use multiple docsets
;; (add-hook 'python-mode-hook
;;    (lambda () (setq zeal-at-point-docset '("python" "django"))))

