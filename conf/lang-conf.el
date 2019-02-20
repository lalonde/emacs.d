;;C/C++
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
(require 'company-go)
;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
(require 'go-eldoc)
;; (ac-config-default)
;;gometalinter
;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; only show errors
(setq flycheck-gometalinter-errors-only t)
;; only run fast linters
(setq flycheck-gometalinter-fast t)
;; use in tests files
(setq flycheck-gometalinter-test t)
;; disable linters
(setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
;; Only enable selected linters
(setq flycheck-gometalinter-disable-all t)
(setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
(setq flycheck-gometalinter-deadline "10s")

(defun my-go-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  (add-hook 'before-save-hook #'gofmt-before-save)
  (flyspell-prog-mode)
;;  (ac-flyspell-workaround)
  (go-eldoc-setup))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline nil :foreground "green"
                    :weight 'bold)

;; protobuf
(require 'protobuf-mode)
