;;; PACKAGES

(require 'package)

;; Get melpas cert authenticated
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

(add-to-list 'package-archives
             '("melpa" .
               "https://melpa.org/packages/"))

(package-initialize)

(defvar my-packages  '(ample-zen-theme
                       auto-complete
                       cider
                       clojure-mode
                       clojure-test-mode
                       company
                       company-go
                       diminish
                       exec-path-from-shell
                       erlang
                       flycheck-gometalinter
                       rainbow-mode
                       go-mode
                       go-eldoc
                       groovy-mode
                       projectile
                       rainbow-delimiters
                       smartparens
                       smex
                       tabbar
                       tabbar-ruler
                       undo-tree
                       yasnippet
                       volatile-highlights))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (if (y-or-n-p (format "Package '%s' is missing. Install it? " p))
	(package-install p))))
