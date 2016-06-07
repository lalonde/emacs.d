;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;Buffer navigation
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "s-d") 'projectile-find-dir)
(global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-f") 'projectile-find-file)
(global-set-key (kbd "s-g") 'projectile-grep)

;;inf-groovy
(add-hook 'groovy-mode-hook
          '(lambda ()
             (inf-groovy-keys)
             ))

;;go auto-complete
(global-set-key (kbd "C-c C-/") 'go-autocomplete)
