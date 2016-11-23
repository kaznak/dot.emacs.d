;;; 50.org-mode.el --- Emacs Org Configuration

;; Files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Key Binding
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; Directory
(setq org-directory (expand-file-name "~/Dropbox/Org"))

;; Tag
(setq org-tags-exclude-from-inheritance
      '("goal" "subgoal" "習慣") )

;; Todo
(setq org-log-done 'time)

(setq org-todo-keywords
      '(
	(sequence
	 "SMDY(x)" ;; inactive todo
	 "WAIT(w)" ;; TODO alternative waiting event with SCHEDULED: in many cases
	 "SCHD(s)" ;; TODO alternative scheduled event with SCHEDULED:
	 "TODO(t)" ;; active todo with DEADLINE: in many cases
	 "|"
	 "DONE(d)" ;; done
	 "CNCL(c)" ;; cancel
	 "MRGE(m)" ;; merged to other task
	 )
	(sequence
	 "HABT(h)" ;; active habit/習慣
	 "|"
	 "DONE(d)" ;; done
	 )
	))

;; Capture
(setq org-capture-templates
      '(("i" "Info" entry   ; info
	 (file+headline (concat org-directory "/Dump.org") "INFO")
	 "* INFO %U\n%?" )
	
	("t" "Todo" entry      ; Todo
	 (file+headline (concat org-directory "/Dump.org") "Todo")
 	 "* TODO %?\n** INFO %U 登録\n %i" )
	("w" "Waiting" entry  ; Waiting
 	 (file+headline (concat org-directory "/Dump.org") "Todo")
 	 "* WAIT %?\n** INFO %U 登録\n  %i" )
 	("s" "Scheduled" entry ; Scheduled
 	 (file+headline (concat org-directory "/Dump.org") "Todo")
 	 "* SCHD %?\n** INFO %U 登録\n  %i" )
	("x" "Someday" entry      ; Todo
	 (file+headline (concat org-directory "/Dump.org") "Todo")
 	 "* SMDY %?\n** %U 登録\n %i" )
	))

;; Agenda
(setq org-agenda-files
      (mapcar(lambda(p)(concat org-directory p))
	     '("/Dump.org"
	       "/Static/"
	       "/Todo/"
	       )))

(setq org-agenda-custom-commands
      '(("x" "My GOALs"
	 ((tags "+goal-someday" nil)
	  (tags "+subgoal-someday" nil)
	  (todo)
	  ) )
	("y" "Weekly Agenda and My unscheduled TODO"
	 ((org-agenda-list 1)
	  (tags-todo "+TODO=\"TODO\"+SCHEDULED<\"<today>\"" nil) ; to reschedule
	  (tags-todo "+TODO=\"TODO\"+SCHEDULED=\"\"" nil) ; to schedule
	  (tags "習慣" nil) ; daily habit
	  ))
	("z" "Someday and Waiting Works"
	 (;; Wait
	  (tags-todo "+TODO=\"WAIT\"-SCHEDULED=\"\"" nil) ; scheduled wait 
	  (tags-todo "+TODO=\"WAIT\"+SCHEDULED=\"\"" nil) ; unscheduled wait
	  ;; someday
	  (tags "+goal+someday" nil)
	  (tags "+subgoal+someday" nil)
	  (tags-todo "+TODO=\"SMDY\"" nil) ; someday
	  ))
	))
