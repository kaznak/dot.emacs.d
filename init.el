;;; init-loader --- Load initialization files

;; Setup package.el
(require 'package)
(require 'cl)

(setq load-path (cons (expand-file-name "~/.emacs.d/elpa") load-path))
(load (expand-file-name "~/.emacs.d/packages-list.el"))

(setq package-archives my-package-archives)

(setq package-pinned-packages
      (loop for pkg in my-packages
	    when (nth 2 pkg)
	    collect (cons (nth 0 pkg) (nth 2 pkg)) ) )

(package-initialize)

;; Handle Initialization files
(let ((init-directory (expand-file-name "~/.emacs.d/init")))

  ;; Bytecompile 
  (byte-recompile-directory init-directory 0)

  ;; Load
  (dolist(file (mapcar 'file-name-sans-extension 
		       (directory-files init-directory t ".*\\.el$") ))
    (message "Loading config file:%s" file)
    (load file)
    ;; (message "Loaded config file:%s" file)
    ))
