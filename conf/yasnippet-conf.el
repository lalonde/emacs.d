(use-package yasnippet)

(add-to-list 'yas/snippet-dirs (concat my-emacs-personal-dir "/snippets/"))
(yas/global-mode 1)

(add-to-list 'auto-mode-alist '("/snippets/" . snippet-mode))
