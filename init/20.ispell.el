;;; 20.ispell.el --- ispell configuration

(setq-default ispell-program-name "aspell")

(setq ispell-local-dictionary "en")
(eval-after-load "ispell" ;; skip japanese charactor
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
