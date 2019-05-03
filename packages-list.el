
(defvar my-package-archives
  '(
    ("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "http://stable.melpa.org/packages/")
    ("org" . "http://orgmode.org/elpa/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ;; ("marmalade" . "https://marmalade-repo.org/packages/")
    ("ELPA" . "http://tromey.com/elpa/")
  ))

(defvar my-packages
  '(
    ;; * package manager
    (package-utils "Extensions for package.el" )
    ;; (auto-package-upddate "Automatically update Emacs packages." )

    ;; * Input methods
    (mozc "minor mode to input Japanese with Mozc" )

    ;; * applications
    (w3m "an Emacs interface to w3m" )
    (org "Outline-based notes management and organizer" )
    (magit "A Git porcelain inside Emacs" )
    (gist "Emacs integration for gist.github.com" )
    (google-translate "Emacs interface to Google Translate." )
    (zeal-at-point "Search the word at point with Zeal" )

    ;; * language tool
    (flycheck "On-the-fly syntax checking" )

    ;; * syntax highlighter
    (web-mode "major mode for editing web templates" )
    (markdown-mode "Major mode for Markdown-formatted text" )
    (yaml-mode "Major mode for editing YAML files" )
    (adoc-mode "a major-mode for editing AsciiDoc files" )
    (haskell-mode "A Haskell editing mode" )
    (rust-mode "A major emacs mode for editing Rust source code" )
    (php-mode "Major mode for editing PHP code" )
    (bison-mode "Major mode for editing bison, yacc and lex files." )
    (rjsx-mode "Real support for JSX" )
    (hcl-mode "Major mode for Hashicorp" )
    (dockerfile-mode "Major mode for editing Docker's Dockerfiles" )
    (powershell "Mode for editing PowerShell scripts" )

    ;; * syntax checker
    (flycheck "On-the-fly syntax checking" )
    (flycheck-rust "Flycheck: Rust additions and Cargo support" )

    ;; * IDE
    (projectile "Manage and navigate projects in Emacs easily" )
    (cider "Clojure Interactive Development Environment that Rocks"
	   "melpa-stable" )
    (slime "Superior Lisp Interaction Mode for Emacs"
	   "melpa-stable" )
    )
  "((PACKAGE-SYMBOL DOC-STRING [PINNED-REPOSITORY])...)"
  )
