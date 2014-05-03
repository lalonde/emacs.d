(global-auto-revert-mode 1)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(windmove-default-keybindings)

(require 'flyspell)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
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

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;smex makes M-x soooooo much better
(setq smex-save-file (expand-file-name ".smex-items" my-emacs-app-data-dir))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(frame-restore-mode)

;; (desktop-save-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;(add-hook 'c-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
