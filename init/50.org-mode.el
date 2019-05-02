;;; 50.org-mode.el --- Emacs Org Configuration

;; Directory
(setq org-directory (expand-file-name "~/.emacs.d/Org.Current"))

;; buffer
(setq org-startup-truncated nil)

;; Files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Key Binding
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; Time stamp
(setq org-log-done 'time)

;; Babel
(require 'ob-clojure)

(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
;; (shell-command-to-string "{ p=$(which ditaa) ; readlink -f $(dirname $p)/$(readlink $p) | tr -d '\n' ; }")

(setq org-confirm-babel-evaluate nil) ; don't ask before evaluation
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t) ; default: t
   (sh . t)
   (ruby . t)
   (clojure . t)
   (ditaa . t)
   (dot . t)
   ))



;; Load Org local Settings
(byte-recompile-directory org-directory 0)
(dolist(file (mapcar 'file-name-sans-extension 
		     (directory-files org-directory t ".*\\.el$") ))
  (message "Loading config file:%s" file)
  (load file)
  ;; (message "Loaded config file:%s" file)
  )
