;;; setup.el --- Setup packages for new environment

;;; Configuration Variables:
(defvar setup-packages
  '(
    ;; * package manager
    package-utils		; Extensions for package.el
    ;; auto-package-upddate	; Automatically update Emacs packages.

    ;; * Input methods
    mozc                        ; minor mode to input Japanese with Mozc

    ;; * applications
    w3m                         ; an Emacs interface to w3m
    org				; Outline-based notes management and organizer
    magit			; A Git porcelain inside Emacs
    gist                        ; gist.el -- Emacs integration for gist.github.com
    google-translate            ; Emacs interface to Google Translate.
    ;; navi2ch			; Navigator for 2ch for Emacsen
    zeal-at-point		; Search the word at point with Zeal

    ;; * syntax highlighter
    web-mode			; major mode for editing web templates
    markdown-mode		; Major mode for Markdown-formatted text
    yaml-mode			; Major mode for editing YAML files

    haskell-mode		; A Haskell editing mode
    rust-mode			; A major emacs mode for editing Rust source code
    php-mode			; Major mode for editing PHP code
    ;; bison-mode			; Major mode for editing bison, yacc and lex files.

    hcl-mode			; Major mode for Hashicorp

    ;; * syntax checker
    ;; flycheck-rust
    )
  "List of install packages" )

;; Main routine
(eval-when-compile (require 'cl))

(when (require 'package)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
  ;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
  (package-initialize)

  ;; Install from Package
  (let ((pkgs (loop for pkg in setup-packages
		    unless (package-installed-p pkg)
		    collect pkg )))

    (unless pkgs (message "%s" "No package will be installed."))

    (when pkgs
      ;; check for new packages (package versions)
      (message "%s" "Get latest versions of all packages...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (pkg pkgs)
	(package-install pkg))))
  
  )
