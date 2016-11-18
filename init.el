;;; init-loader --- Load initialization files

(package-initialize)

;; Load Initialization files
(let ((init-directory (expand-file-name "~/.emacs.d/init")))
  ((lambda(files)
     (dolist(file files)
       (load file)
       (message "Loaded config file:%s" file) ))
   (mapcar 'file-name-sans-extension 
	   (directory-files init-directory t ".*\\.el$") )
   ))

