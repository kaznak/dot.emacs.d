;;; 50.org-mode.el --- Emacs Org Configuration

;; Files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Binding
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; Directory
(setq org-directory (expand-file-name "~/Dropbox/Org"))

;; Capture
(setq org-capture-templates
      '(("j" "Journal" entry   ; Diary and Memo
	 (file+headline (concat org-directory "/Journal.org") "Journal")
	 "* Journal %U \n%?" )
	
	("t" "Todo" entry      ; Todo
	 (file+headline (concat org-directory "/Journal.org") "Task")
 	 "* TODO %? \nDEADLINE: %T\n** %U\n %i" )
 	("s" "Scheduled" entry ; Schedule
 	 (file+headline (concat org-directory "/Journal.org") "Task")
 	 "* SCHD %? \nSCHEDULED: %T\n** %U\n  %i" )
	))

;; Agenda
(setq org-agenda-files
      (mapcar(lambda(p)(concat org-directory p))
	     '("/Journal.org"
	       "/Project/"
	       "/Static/"
	       )))

;; Misc
(setq org-log-done 'time)

