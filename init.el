;;; VERSION and BOOTSTRAP
(when (version< emacs-version "24.3") (error "Lets run something greater than 24.2"))

;;; define directories and a little helper function
(defconst my-emacs-base-dir (file-name-directory load-file-name)
  "My emacs base directory")
(defconst my-emacs-conf-dir (expand-file-name "conf" my-emacs-base-dir)
  "My emacs conf directory for modules")
(defconst my-emacs-personal-dir (expand-file-name "personal" my-emacs-base-dir)
  "My emacs personal directory")
(defconst my-emacs-vendor-dir (expand-file-name "vendor" my-emacs-base-dir)
  "My emacs vendor directory for packages not in melpa")
(defconst my-emacs-app-data-dir (expand-file-name "app-data" my-emacs-base-dir)
  "My emacs app data directory for state storage")
(defun load-conf (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load (expand-file-name file my-emacs-conf-dir)))

;;; start loading customizations
(setq custom-file (expand-file-name "custom.el" my-emacs-personal-dir))

(add-to-list 'load-path my-emacs-vendor-dir)

(load-conf "package-conf")
(load-conf "editor-conf")
(load-conf "cedet-conf")
(load-conf "visual-conf")
(load-conf "yasnippet-conf")

(load-conf "sqlplus-conf")
(load-conf "tabbar-conf")
(load-conf "keys-conf")

(when (file-exists-p my-emacs-personal-dir)
  (message "Loading personal configuration files in %s..." my-emacs-personal-dir)
  (mapc 'load (directory-files my-emacs-personal-dir 't "^[^#].*el$")))
