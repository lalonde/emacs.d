;; LSP
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((go-mode . lsp-deferred) (python-mode . lsp-deferred)))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

;;
;;C/C++
(use-package ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (set (make-local-variable 'company-backends) '(company-clang))
              (company-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;;Go

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; (use-package go-mode
;; 	     :defer f
;; 	     :ensure t
;; 	     :config
;; 	       (defun my-go-mode-hook ()
;; 		 (set (make-local-variable 'company-backends) '(company-go))
;; 		 (add-hook 'before-save-hook 'gofmt-before-save nil 'local)
;; 		 (flyspell-prog-mode))
;; 	     :hook (go-mode . my-go-mode-hook))
;;
;; (use-package company-go
;; 	     :defer t
;; 	     :ensure t)

;; (use-package go-eldoc
;; 	     :ensure t
;; 	     :defer t
;; 	     :config
;; 	       (set-face-attribute 'eldoc-highlight-function-argument nil
;; 				   :underline nil :foreground "green" :weight 'bold)
;; 	     :hook (go-mode . go-eldoc-setup))

;; golangci-lint
;;(setq flycheck-golangci-lint-config "path/to/config")
;;(setq flycheck-golangci-lint-deadline "1m")
(setq flycheck-golangci-lint-tests t)
(setq flycheck-golangci-lint-fast t)
;;(setenv "GO111MODULE" "on")

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; Keep go.mod file from entering modula-2 mode
(add-to-list 'auto-mode-alist '("go\\.mod\\'" . text-mode))

;; protobuf
(use-package protobuf-mode
	     :ensure t
	     :config
	       (defun my-proto-mode-hook ()
		 (add-hook 'before-save-hook 'clang-format-buffer nil 'local))
	     :mode ("\\.proto\\'" . protobuf-mode)
	     :hook (protobuf-mode . my-proto-mode-hook))

;; Python
(setq python-shell-interpreter "python3")

;; YAML
(use-package yaml-mode)
