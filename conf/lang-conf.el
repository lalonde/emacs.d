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
(require 'company-go)
;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
(require 'go-eldoc)
;; golangci-lint
;;(setq flycheck-golangci-lint-config "path/to/config")
;;(setq flycheck-golangci-lint-deadline "1m")
(setq flycheck-golangci-lint-tests t)
(setq flycheck-golangci-lint-fast t)
;;(setenv "GO111MODULE" "on")
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

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
;; Keep go.mod file from entering modula-2 mode
(add-to-list 'auto-mode-alist '("go\\.mod\\'" . text-mode))

;; protobuf
(require 'protobuf-mode)
(autoload 'protobuf-mode "protobuf-mode" "" t nil)
(add-to-list 'auto-mode-alist (cons "\\.proto\\'" 'protobuf-mode))
;; (add-hook 'protobuf-mode-hook
;;           (function (lambda ()
;;                     (add-hook 'before-save-hook
;;                               'clang-format-buffer))))
