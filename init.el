;;; init-loader --- Load initialization files

(package-initialize)

;; Load Initialization files
(let ((init-directory (expand-file-name "~/.emacs.d/init")))
  (dolist(file (mapcar 'file-name-sans-extension 
		       (directory-files init-directory t ".*\\.el$") ))
    (message "Loading config file:%s" file)
    (load file)
    ;; (message "Loaded config file:%s" file)
    ))
