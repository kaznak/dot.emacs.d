;;; 50.org-mode.el --- Emacs Org Configuration

;; buffer
(setq org-startup-truncated nil)

;; Files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Key Binding
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; Directory
(setq org-directory (expand-file-name "~/WinHome/Dropbox/Work/Org/Org.20171231"))

;; Tag
(setq org-tags-exclude-from-inheritance
      '("goal" "subgoal" "position" "loop" "習慣") )

;; Todo
(setq org-log-done 'time)

(setq org-todo-keywords
      '(
	(sequence
	 "SMDY(x)" ;; inactive todo
	 "NEXT(n)" ;; active todo, waiting done of other todo.
	 "WAIT(w)" ;; active todo, but waiting event or with SCHEDULED: in many cases.
	 "SCHD(s)" ;; scheduled event with SCHEDULED:.
	 "TODO(t)" ;; active todo with DEADLINE: in many cases.
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
;; * This is Inbox of GTD
(setq org-capture-default-file
      (concat org-directory
	      "/" "Diary"
	      "/" (format-time-string "%Y-%m-%d"
				      (current-time)) "." "Diary.org")
      )

(setq org-capture-templates
      '(("i" "Info" entry   ; Info
	 (file+headline org-capture-default-file "Diary")
	 "* %U\n%?" )
	("t" "Todo" entry      ; Todo
	 (file+headline org-capture-default-file "Diary")
 	 "* TODO %?\n** %U 登録\n %i" )
	("w" "Waiting" entry  ; Waiting
 	 (file+headline org-capture-default-file "Diary")
 	 "* WAIT %?\n** %U 登録\n %i" )
 	("s" "Scheduled" entry ; Scheduled
 	 (file+headline org-capture-default-file "Diary")
 	 "* SCHD %?\n** %U 登録\n %i" )
	("x" "Someday" entry      ; Todo
	 (file+headline org-capture-default-file "Diary")
 	 "* SMDY %?\n** %U 登録\n %i" )
	))

;; Agenda
(setq org-agenda-files
      (mapcar(lambda(p)(concat org-directory p))
	     '("/Diary/"
	       "/Static/"
	       "/Project/"
	       )))

(setq org-agenda-custom-commands
      '(("x" "My GOALs"
	 ((tags "+goal-someday" nil)
	  (tags "+subgoal-someday" nil)
	  (tags "+position" nil)
	  (todo)
	  ) )
	("y" "Today's Agenda and My unscheduled TODO"
	 ((tags "習慣" nil) ; daily habits and routines
	  (org-agenda-list 2)
	  ;; (tags-todo "-loop+TODO=\"TODO\"+SCHEDULED<\"<today>\"" nil) ; to reschedule
	  (tags-todo "-loop+TODO=\"TODO\"+SCHEDULED=\"\"" nil) ; to schedule
	  ))
	("z" "Someday and Waiting Works"
	 (;; Wait and NEXT
	  (tags-todo "+TODO=\"WAIT\"-SCHEDULED=\"\"" nil) ; scheduled wait 
	  (tags-todo "+TODO=\"WAIT\"+SCHEDULED=\"\"" nil) ; unscheduled wait
	  (tags-todo "+TODO=\"NEXT\"" nil) ; NEXT actions
	  ;; scheduled
	  (tags-todo "+TODO=\"SCHD\"-SCHEDULED=\"\"" nil) ; scheduled SCHD
	  ;; someday
	  ;; (tags "+goal+someday" nil)
	  ;; (tags "+subgoal+someday" nil)
	  (tags-todo "+TODO=\"SMDY\"" nil) ; someday
	  ))
	))

;; Load Org local Settings
(byte-recompile-directory org-directory 0)
(dolist(file (mapcar 'file-name-sans-extension 
		     (directory-files org-directory t ".*\\.el$") ))
  (message "Loading config file:%s" file)
  (load file)
  ;; (message "Loaded config file:%s" file)
  )

;; Old Codes
;; ;; ditaa との連携
;; (setq org-ditaa-jar-path "~/UnixApplications/share/jditaa/jditaa.jar")

;; ;; コードを評価するとき尋ねない
;; (setq org-confirm-babel-evaluate nil)
;; ;; 有効にする言語(デフォルトではelispのみ)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ditaa . t)
;;    (dot . t)))
