(load (expand-file-name "cedet-bzr/cedet-devel-load" my-emacs-base-dir))
(load (expand-file-name "cedet-bzr/contrib/cedet-contrib-load" my-emacs-base-dir))

(setq semanticdb-default-save-directory
      (expand-file-name "semanticdb" my-emacs-app-data-dir))
;; select which submodes we want to activate
;;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;;(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;;(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(semantic-mode 1)

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))
(global-ede-mode 1)                      ; Enable the Project management system
(ede-enable-generic-projects)
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(defun my-cedet-hook ()
  (local-set-key "\C-c/" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; Setup JAVA....
(require 'cedet-java)
(require 'semantic/db-javap)
