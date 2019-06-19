(global-auto-revert-mode 1)

(windmove-default-keybindings)


(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell)
  (setenv "SHELL" "/bin/zsh")
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;;Make dired happy with my system
;;(when (eq system-type 'darwin)
;;  (use-package ls-lisp)
;;  (setq ls-lisp-use-insert-directory-program nil))
(put 'dired-find-alternate-file 'disabled nil)

(use-package flyspell
	     :init
	       (flyspell-mode t)
	     :config
	       (setq ispell-program-name "aspell"
		     ispell-list-command "--list"
		     ispell-extra-args '("--sug-mode=ultra")))

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
(use-package smex
  :init (smex-initialize)
  :config (setq smex-save-file (expand-file-name ".smex-items" my-emacs-app-data-dir)))

;; projectile is a project management mode
(setq projectile-cache-file (expand-file-name  "projectile.cache" my-emacs-app-data-dir))

(use-package projectile
  :init (projectile-global-mode t)
  :diminish "Prjl")


(desktop-save-mode 0)
;;(setq desktop-restore-eager 5)
;;(setq desktop-clear-preserve-buffers-regexp (append '("^regex! use it!") desktop-clear-preserve-buffers-regexp)

(use-package whitespace
	     :ensure t
	     :defer t
	     :init (global-whitespace-mode t)
	     :config
	       (setq whitespace-global-modes '(c-mode java-mode)
		     whitespace-style '(face trailing tabs newline tab-mark))
	     :hook
	       (before-save . delete-trailing-whitespace))


(use-package company
  :bind ("C-c C-c" . company-complete)
  :commands company-mode
  :ensure t
  :init
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf
           company-yasnippet)
          (company-abbrev company-dabbrev))

        company-tooltip-limit 20  ; bigger popup window
        company-idle-delay nil     ; decrease delay before autocompletion popup shows
        company-echo-delay 0)      ; remove annoying blinking
  :diminish company-mode
  :hook (go-mode . company-mode))

;; Fix emacs 25
(define-key global-map "\M-*" 'pop-tag-mark)
