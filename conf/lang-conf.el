;;Groovy
(require 'inf-groovy)

;; Better java indentation
(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'java-mode-hook 'my-indent-setup)
