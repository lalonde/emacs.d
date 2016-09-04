;;Groovy
(require 'inf-groovy)

;; Better java indentation
(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'java-mode-hook 'my-indent-setup)

;;Go autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook #'gofmt-before-save)
  (flyspell-prog-mode)
  (ac-flyspell-workaround)
  (go-eldoc-setup))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline f :foreground "green"
                    :weight 'bold)
