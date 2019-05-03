;;; setup.el --- Setup packages for new environment

;; Main routine
(require 'cl)
(require 'package)
(package-initialize t)

(setq load-path (cons (expand-file-name "~/.emacs.d/elpa") load-path))

(load (expand-file-name "~/.emacs.d/packages-list.el"))
(setq package-archives my-package-archives)
(setq package-pinned-packages
      (loop for pkg in my-packages
	    when (nth 2 pkg)
	    collect (cons (nth 0 pkg) (nth 2 pkg)) ) )

(message "%s" "Refreshing package list......")
(package-refresh-contents)
(message "%s" " done.")

;; Install from Package
(let ((pkgs (mapcar 'car my-packages)))
  (unless pkgs (message "%s" "No package will be installed."))
  (when   pkgs
    ;; check for new packages (package versions)
    (dolist (pkg pkgs)
      (unless (package-installed-p pkg)
	(package-install pkg) ))
    ))
