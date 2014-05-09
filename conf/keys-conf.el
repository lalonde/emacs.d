;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;;Buffer navigation
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "s-d") 'projectile-find-dir)
(global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-f") 'projectile-find-file)
(global-set-key (kbd "s-g") 'projectile-grep)
