(global-auto-revert-mode 1)

(windmove-default-keybindings)

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "JAVA_HOME")
(exec-path-from-shell-copy-env "GROOVY_HOME")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;Make dired happy with my system
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
(put 'dired-find-alternate-file 'disabled nil)

(require 'flyspell)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-list-command "--list"
      ispell-extra-args '("--sug-mode=ultra"))
(flyspell-mode t)

(setq ido-enable-prefix nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" my-emacs-app-data-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)

(ido-mode t)

;; taken from prelude.  i like this order
;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;smex makes M-x soooooo much better
(setq smex-save-file (expand-file-name ".smex-items" my-emacs-app-data-dir))
(smex-initialize)

;; projectile is a project management mode
(setq projectile-cache-file (expand-file-name  "projectile.cache" my-emacs-app-data-dir))

(projectile-global-mode t)
(diminish 'projectile-mode "Prjl")


(desktop-save-mode 0)
;;(setq desktop-restore-eager 5)
;;(setq desktop-clear-preserve-buffers-regexp (append '("^regex! use it!") desktop-clear-preserve-buffers-regexp)

(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-global-modes '(c-mode java-mode))
(setq whitespace-style '(face trailing tabs newline tab-mark))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;(add-hook 'c-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; set default `company-backends'
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        (company-abbrev company-dabbrev)
        ))
(require 'company)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking

;; Fix emacs 25
(define-key global-map "\M-*" 'pop-tag-mark)
