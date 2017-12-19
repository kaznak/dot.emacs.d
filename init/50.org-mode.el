;;; 50.org-mode.el --- Emacs Org Configuration

;; buffer
(setq org-startup-truncated nil)

;; Files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Key Binding
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; Directory
(setq org-directory (expand-file-name "~/Dropbox/Org"))

;; Tag
(setq org-tags-exclude-from-inheritance
      '("goal" "subgoal" "loop" "習慣") )

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
;; * This is Inbox of GTD
(setq org-capture-default-file
      (concat org-directory
	      "/" "Diary"
	      "/" (format-time-string "%Y-%m-%d"
				      (current-time)) "." "Diary.org")
      )
(defun org-capture-default-file-update()
  (setq org-capture-default-file
	(concat org-directory
		"/" "Diary"
		"/" (format-time-string "%Y-%m-%d"
					(current-time)) "." "Diary.org")
	)
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
	  (todo)
	  ) )
	("y" "Today's Agenda and My unscheduled TODO"
	 ((tags "習慣" nil) ; daily habits
	  (org-agenda-list 1)
	  ;; (tags-todo "-loop+TODO=\"TODO\"+SCHEDULED<\"<today>\"" nil) ; to reschedule
	  (tags-todo "-loop+TODO=\"TODO\"+SCHEDULED=\"\"" nil) ; to schedule
	  
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
