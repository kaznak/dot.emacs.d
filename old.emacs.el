;;; * 疑問

;; ** setq & setq-default @ .emacs.el
;; .emacs.elではsetqとsetq-defaultのどちらを使うべきか。
;; setq-defaultならバッファ毎にsetqしても全体に影響は出ない。
;; しかしバッファごとに値のコピーを保持している可能性が有り、
;; これはパフォーマンスに悪影響がある。
;; setqではバッファ毎にmake-local-variableする必要があるが
;; こういう心配とは無縁。

;; ** lisp/loaddefs.el
;; どうやらいろいろなautoloadや事前のdefvarをやってくれている見たいだけど
;; どのタイミングでロードされてるの?

;;; * load-path
(let((original-default-directory default-directory))
  (dolist(dir(list "~/utils/share/emacs/site-lisp"
		   "/opt/local/share/emacs/site-lisp" ))
    (when(file-accessible-directory-p dir)
      (setq default-directory dir)
      (normal-top-level-add-subdirs-to-load-path) ))
  (setq default-directory original-default-directory) )

;; (setq frame-title-format (concat  "%b - emacs@" system-name))

;; (push(concat *user-local-tree* "info")
;;      Info-default-directory-list )

;; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

;; ;; MigMix 1MをEmacsのデフォルトのフォントに
;; (add-to-list 'default-frame-alist '(font . "MigMix 1M"))

;; ;; 英語
;; (set-face-attribute 'default nil
;; 		    :family "Menlo" ;; font
;; 		    :height 150)    ;; font size

;; ;; 日本語
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;;  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; ;; 半角と全角の比を1:2にしたければ
;; (setq face-font-rescale-alist
;; ;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
;;       '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

(set-face-attribute 'default nil :family "Menlo" :height 140)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN"))
(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))


;;; * Emacs
(setq confirm-kill-emacs 'yes-or-no-p) ;; confirm when killing emacs

(define-key global-map [?\M-\] "\\")

;;; ** 8 The Mark and the Region
;;; *** 8.2 Transient Mark Mode
;;(setq transient-mark-mode t)

;;; ** 10 Controlling the Display
;;; *** 10.2 Font Lock mode
;; lisp/font-lock.el
(when(fboundp 'global-font-lock-mode)(global-font-lock-mode t))

;;; ** 12 Commands for Fixing Typos
;;; *** 12.4 Checking and Correcting Spelling
;; lisp/textmodes/ispell.el
(setq-default ispell-program-name "aspell") ;; use aspell instead of ispell
;; Additionally Setting: echo 'lang en_US' >>/etc/aspell.conf
(setq ispell-local-dictionary "en") ;; use english dictionary sintead of $LANG
(eval-after-load "ispell" ;; treat japanese charactor
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;;; ** 13 File Handling
;;; *** 13.11 Accessing Compressed Files
;; lisp/jka-compr.el ;; browse compressed files as normal file
(auto-compression-mode t) 

;;; ** 16 Frames and X Windows
;;; *** 16.14 Scrolling With "Wheeled" Mice
(when window-system ;; lisp/mwheel.el: enable wheelmouse support by default
  (mwheel-install) )

;;; ** 17 International Character Set Support
;; lisp/international/mule-cmds.el
;;; *** 17.3 Language Environments
(set-language-environment "Japanese") ;; as a default language
(prefer-coding-system 'utf-8)
;;; *** 17.5 Selecting an Input Method
;;; **** UIM
;;(require 'uim)
;;(autoload 'uim-mode "uim" nil t)
;;; **** UIM@LEIM(anthy)
;;(require 'uim-leim);looks like not needed
;;(setq default-input-method "japanese-anthy-uim")
;;; **** Anthy@LEIM(Direct)
;;(require 'anthy);looks like not needed
;;(setq default-input-method "japanese-anthy")

;;; ** 18 Major Modes
;;; *** 18.1 How Major Modes are Chosen
;; lisp/files.el
;;; + makefile-mode
(add-to-list 'auto-mode-alist '("*Makefile*$" . makefile-mode))
(add-to-list 'auto-mode-alist '("Makefile\\..*$" . makefile-mode))
(add-to-list 'auto-mode-alist '("Makeconf" . makefile-mode))
;;; + shell-script-mode
;;(add-to-list 'auto-mode-alist '("rc.*$" . shell-script-mode))
;;(add-to-list 'auto-mode-alist '("\\.subr$" . shell-script-mode))

;;; ** 19 Controlling the Display
;;; *** 19.13 Optional Mode Line Features
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
;; (setq display-time-string-forms ;; ISO-8601 base
;;       '(year "-" month "-" day "T" 24-hours ":" minutes time-zone(if mail " Mail" "")) )
(display-time)

;;; ** 20 Commands for Human Languages
;;; *** 20.9 TeX Mode
(add-hook 'latex-mode-hook 'outline-minor-mode)
;;; **** 20.9.4 TeX Mode Miscellany
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

;;; ** 21 Editing Programs
;;; *** 21.1 Major Modes for Programming Languages
;;; *** 21.7 Hideshow minor mode
;;; + c-mode
;; lisp/progmodes/cc-mode.el
(add-hook 'c-mode-common-hook 'hs-minor-mode)
;;; + lisp-mode
;; lisp/emacs-lisp/lisp-mode.el
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
;;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
;;(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-to-list 'auto-mode-alist '("*.asd" . lisp-mode));ASDF file
;;; + scheme-mode
;; lisp/progmods/scheme-mode.el
(add-hook 'scheme-mode-hook 'outline-minor-mode)
;;(add-hook 'scheme-mode-hook 'hs-minor-mode)
;;(setq scheme-program-name "scm -r5") ; for run-scheme command
;;(setq scheme-program-name "gosh -l ~/utils/share/scheme/gauche/myutils.scm -i") ; for run-scheme command
(setq scheme-program-name "gosh -i") ; for run-scheme command
(add-hook 'inferior-scheme-mode-hook ; for Gauche default encoding
  (lambda()(set-buffer-process-coding-system 'utf-8 'utf-8)) )

;;; + perl-mode
(add-hook 'perl-mode-hook 'outline-minor-mode)

;;; + cperl-mode
;; lisp/progmodes/cperl-mode.el
(defalias 'perl-mode 'cperl-mode)
;;(add-hook 'cperl-mode-hook 'hs-minor-mode)
(add-hook 'cperl-mode-hook 'outline-minor-mode)

;;; + prorpg-mode
;; lisp/progmodes/prorog.el
(setq prolog-program-name "swipl") ; run-prolog command

;;; ** 22 Compiling and Testing Programs
;;; *** 22.1 Running Compilations under Emacs
(setq compile-command "LC_ALL=C gmake -k")

;;; *** 22.10 Running an External Lisp
;; lisp/progmodes/inf-lisp.el
;;(setq inferior-lisp-program "sbcl")
(setq inferior-lisp-program "alisp")

;;; ** 29.15 Running Shell Commands from Emacs
;;; *** 29.15.3 Shell Mode
(add-hook 'comint-output-filter-functions ; hide password
	  'comint-watch-for-password-prompt)

;;; *** 29.28 Hyperlinking and Navigation Features
;;; **** 29.28.1 Following URLs
;; lisp/net/browse-url.el
;;(setq browse-url-netscape-program "mozilla")
;;(setq browse-url-netscape-program "firefox")
;;(setq browse-url-browser-function 'w3m-browse-url)

;;; **** 29.28.4 Finding Function and Variable Definitions
;; lisp/emacs-lisp/find-func.el
;;(load "find-func") ;; without key-settings
(find-function-setup-keys) ;; with key-settings

;;; * 30 Commands for Human Languages
;;; ** 30.8 Outline Mode
(add-hook 'outline-mode-hook
	  ;; FIXME: doesnt work correctlly
	  (lambda()
	    (local-set-key "\C-c>" 'comment-region)
	    (local-set-key "\C-c<" 'uncomment-region) ))

;;; * elisp

;;; ** 18 Debugging Lisp Programs
;;; *** 18.1 The Lisp Debugge
;;; **** 18.1.1 Entering the Debugger on an Error
(setq debug-on-error t) ; launch debugger when error

;;; ** 25 Files
;;; *** 25.2 Saving Buffers
(setq require-final-newline t)
(add-hook 'before-save-hook 'time-stamp)

;;; ** 29 Frames
;;; *** 29.9 Input Focus
(when window-system
  ;; lisp/frame.el:
  ;; make switching frames works properly under the default click-to-focus
  (setq focus-follows-mouse nil))
;;; *** 29.4 Frame Titles
;;(setq frame-title-format (concat  "%b - emacs@" system-name))

;;; ** misc emacs
(if window-system ;; C-z is not iconify when working on window system
    ;; window-system: elisp.info:38.19
    (global-set-key "\C-z" 'shell))

;;; *** iimage-mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
;; (add-hook 'info-mode-hook 'turn-on-iimage-mode)
;; (add-hook 'wiki-mode-hook 'turn-on-iimage-mode)

(column-number-mode)

;;; * package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/")t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; * ExternalPackages
;;; ** SLIME
;; (require 'slime-autoloads)  ; use autoload See slime.info.2.5.1
;; (slime-setup '(slime-repl slime-autodoc))
;; (setq slime-lisp-implementations	; lisp programs
;;       `((sbcl       ("sbcl"))
;; 	(sbcl-slime ("sbcl" "--core" 
;; 		     ;;(mapc 'require '(sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf))
;; 		     ;;(save-lisp-and-die "/home/<username>/.sbcl/sbcl.core-for-slime")
;; 		     ,(expand-file-name "~/.sbcl/sbcl.core-for-slime") ))
;; 	(sbcl-swank ("sbcl" "--core"
;; 		     ;;(load "/<slime-load-path>/swank-loader.lisp")
;; 		     ;;(swank-loader:dump-image "/home/<username>/.sbcl/sbcl.core-with-swank")
;; 		     ,(expand-file-name "~/.sbcl/sbcl.core-with-swank") )
;; 		    :init (lambda (port-file _)
;; 			    (format "(swank:start-server %S)\n" port-file)))
;; 	;;(acl        ("alisp") :coding-sytem ascii)
;; 	(acl        ("alisp"))
;; 	))
;; (setq slime-default-lisp 'acl) ; lookup key for slime-lisp-implementations

;;; *** hyperspec.el
;; (setq common-lisp-hyperspec-root
;;       "/usr/local/share/doc/clisp-hyperspec/HyperSpec/"
;;       ;;"/usr/local/share/doc/clisp-hyperspec/"
;;       common-lisp-hyperspec-symbol-table
;;       "/usr/local/share/doc/clisp-hyperspec/HyperSpec/Data/Map_Sym.txt"
;;       ;;"/usr/local/share/doc/clisp-hyperspec/Data/Map_Sym.txt"
;;       )

;;; ** Haskell mode
(setq haskell-program-name "stack ghci")

;; ;;; ** emacs-w3m
;; ;;  see ~/.emacs-w3m for more configurations. 
;; (require 'w3m-load)

;; ;;; ** mew
;; (autoload 'mew "mew" nil t)
;; (autoload 'mew-send "mew" nil t)
;; ;;; *** optional setup
;; (autoload 'mew-user-agent-compose "mew" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'mew-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'mew-user-agent
;;       'mew-user-agent-compose
;;       'mew-draft-send-message
;;       'mew-draft-kill
;;       'mew-send-hook))
;; ;;; *** mail setup
;; (setq mew-mail-domain "jaist.ac.jp")
;; (setq mew-smtp-server "smtp.jaist.ac.jp")
;; (setq mew-proto "%") ; use IMAP
;; (setq mew-imap-user "naka-k")  ;; (user-login-name)
;; (setq mew-imap-server "imap.jaist.ac.jp")    ;; if not localhost

;; ;;; ** wl: wanderlust
;; ;; (require 'wanderlust-startup)
;; ;; ;;(add-to-list 'load-path (concat user-elisp-path "/wl")) ; wl base
;; ;; ;;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;; ;; ;; 詳細は ~/.wlへ
;; ;; ;;; *** user wl as mail-user-agent 
;; ;; (autoload 'wl-user-agent-compose "wl-draft" nil t)
;; ;; (if(boundp 'mail-user-agent)(setq mail-user-agent 'wl-user-agent))
;; ;; (if (fboundp 'define-mail-user-agent)
;; ;;     (define-mail-user-agent
;; ;;       'wl-user-agent
;; ;;       'wl-user-agent-compose
;; ;;       'wl-draft-send
;; ;;       'wl-draft-kill
;; ;;       'mail-send-hook))

;; ;;; ** navi2ch
;; ;; more navi2ch configration on ~/.navi2ch/init.el
;; (autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)

;; ;;; ** erc: emacs IRC cliant
;; ;; Please refer to
;; ;; http://www.emacswiki.org/cgi-bin/wiki.pl?EmacsIRCClient
;; ;; for more usage instructions
;; ;;(require 'erc)

;; ;;; ** dictionary: Emacs package for talking to a dictionary server
;; (load "dictionary-init")
;; ;; key bindings
;; (global-set-key "\C-cs" 'dictionary-search)
;; (global-set-key "\C-cm" 'dictionary-match-words)
;; ;; Server Setting(default is dict.org)
;; (setq dictionary-server "localhost")
;; ;; Popup menu for GNU Emacs 21, and XEmacs 21
;; ;; (if (boundp 'running-xemacs)
;; ;;     (global-set-key [(control button3)] 'dictionary-mouse-popup-matching-words)
;; ;;   (global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words))
;; ;; Tool-tip support for GNU Emacs 21
;; ;;(setq dictionary-tooltip-dictionary "eng-deu")
;; ;;(global-dictionary-tooltip-mode 1)

;; ;;; ** ESS: Emacs Speaks Statistics
;; (require 'ess-site)

;; ;;; ** graphviz-dot-mode.el
;; (autoload 'graphviz-dot-mode "graphviz-dot-mode")

;; ;;; ** python-mode.el
;; (autoload 'python-mode.el "python-mode")

;; ;;; ** YaTeX
;; ;;(require 'yatex-startup)

;; ;;; ** HOWM: Hitori Otegaru Wiki Modoki
;; (setq howm-menu-lang 'ja)
;; (global-set-key "\C-c,," 'howm-menu)
;; (autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)
;; ;;(setq howm-directory (expand-file-name "~/howm/"))
;; (add-to-list 'auto-mode-alist '("\\.howm$" . outline-mode))
;; (add-hook 'howm-mode-hook
;;           (function
;;            (lambda ()
;;              (progn
;;                ;; (setq outline-regexp "[=\^L]+")
;;                ;; (setq outline-heading-alist
;;                ;;       '(("=" . 1) ("*" . 2) ("**" . 3)
;;                ;;         ("***" . 4) ("****" . 5)))
;;                (setq outline-regexp (concat "[*=]+"))
;; 	       ))))
;; ;;; ** cscope
;; ;; (require 'xcscope)
;; ;; (define-key global-map [(control f3)]  'cscope-set-initial-directory)
;; ;; (define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;; ;; (define-key global-map [(control f5)]  'cscope-find-this-symbol)
;; ;; (define-key global-map [(control f6)]  'cscope-find-global-definition)
;; ;; (define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
;; ;; (define-key global-map [(control f8)]  'cscope-pop-mark)
;; ;; (define-key global-map [(control f9)]  'cscope-next-symbol)
;; ;; (define-key global-map [(control f10)] 'cscope-next-file)
;; ;; (define-key global-map [(control f11)] 'cscope-prev-symbol)
;; ;; (define-key global-map [(control f12)] 'cscope-prev-file)
;; ;; (define-key global-map [(meta f9)]     'cscope-display-buffer)
;; ;; (define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)


;; ;;; ** apache-mode.el
;; (autoload 'apache-mode "apache-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
;; (add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
;; (add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
;; (add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
;; (add-to-list 'auto-mode-alist
;; 	     '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; ;;; ** erlang
;; ;; (setq erlang-root-dir "/usr/local/lib/erlang/")
;; ;; (push (concat erlang-root-dir "lib/tools-2.6.6.2/emacs/") load-path)
;; ;; (push (concat erlang-root-dir "bin") exec-path)
;; ;; (require 'erlang-start)

;; ;;; ** remember-mode.el -> move to org-capture
;; (autoload 'remember "remember" nil t)

;;; * org-mode.el
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-set-key "\C-ca" 'org-agenda)

(setq org-directory "~/Dropbox/Org")

;; * 9 Capture - Refile - Archive
;; ** 9.1 Capture
(setq org-default-notes-file (concat org-directory "/bucket.org"))
(define-key global-map "\C-cc" 'org-capture) ;; integrated org-remember

(setq org-capture-templates      ;; とりあえずみんな "Journal.org" にぶち込んで、そのあと整理する。
      '(("t" "Todo" entry        ;; どんな todo もとりあえずこの辺から入れるか...
	 (file+headline (concat org-directory "/Journal.org") "Task")
	 "* TODO %? \nDEADLINE: %T\n登録日: %U\n  %i")
	("s" "Scheduled" entry   ;; 予定
	 (file+headline (concat org-directory "/Journal.org") "Task")
	 "* SCHD %? \nSCHEDULED: %T\n登録日: %U\n  %i")
	("f" "Financial" entry   ;; 出納
	 (file+headline (concat org-directory "/Journal.org") "Journal")
	 "* FINANCIAL %?\n発生日: %U\n借方: \n貸方: \n%i")
        ("j" "Journal" entry        ;; 日記&雑多なメモ
	 (file+headline (concat org-directory "/Journal.org") "Journal")
	 "* Journal %U %?\n %i\a %a") ))

;; * 10 Agenda views
;; ** 10.1 Agenda files
(setq org-agenda-files
      (mapcar(lambda(p)(concat org-directory p))
	     (quote("/Journal.org"
		    "/Project/"
		    "/Static/"
		    ) )))

;; TODO状態
(setq org-todo-keywords
      '(
	(sequence
	 "TODO(t)" ;; active todo
	 "|"
	 "DONE(d)" ;; done is done
	 )
	(sequence
	 "SCHD(s)" ;; scheduled
	 "|"
	 "DONE(d)" ;; done is done
	 )
	(sequence
	 "WAIT(w)" ;; waiting
	 "|"
	 "DONE(d)" ;; done is done
	 )
	;; (sequence
	;;  "PEND(p)" ;; pending will being done someday...
	;;  "WAIT(w)" ;; waiting
	;;  "SCHD(s)" ;; scheduled
	;;  "TODO(t)" ;; active todo
	;;  "|"
	;;  "DONE(d)" ;; done is done
	;;  "CNCL(c)" ;; cancel
	;;  )
	))

;; DONEの時刻を記録
(setq org-log-done 'time)

;; ditaa との連携
(setq org-ditaa-jar-path "~/UnixApplications/share/jditaa/jditaa.jar")

;; コードを評価するとき尋ねない
(setq org-confirm-babel-evaluate nil)
;; 有効にする言語(デフォルトではelispのみ)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (dot . t)))

;; ;;; * simple-httpd
;; (require 'simple-httpd)
;; ;; (setq httpd-root "/var/www")

;; ;;; * Impatient Mode
;; (require 'impatient-mode)

;;; * elm-mode.el
;;(require 'elm-mode)

;;; * markdown-mode.el
;;(require 'markdown-mode)
;;(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;; * js2-mode.el
;;(require 'js2-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;; * web-mode.el
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

