;
;C/C++
(require 'ggtags)
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

;;Groovy
;(require 'inf-groovy)

;; Better java indentation
;(defun my-indent-setup ()
;  (c-set-offset 'arglist-intro '+))
;(add-hook 'java-mode-hook 'my-indent-setup)

;;Go
(use-package go-mode
	     :defer f
	     :ensure t
	     :config
	       (defun my-go-mode-hook ()
		 (set (make-local-variable 'company-backends) '(company-go))
		 (add-hook 'before-save-hook 'gofmt-before-save nil 'local)
		 (flyspell-prog-mode))
	     :hook (go-mode . my-go-mode-hook))
	       
(use-package company-go
	     :defer t
	     :ensure t)

(use-package go-eldoc
	     :ensure t
	     :defer t
	     :config
	       (set-face-attribute 'eldoc-highlight-function-argument nil
				   :underline nil :foreground "green" :weight 'bold)
	     :hook (go-mode . go-eldoc-setup))

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
