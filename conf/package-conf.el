;;; PACKAGES
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages  '(ample-zen-theme
                       auto-complete
                       cider
                       clojure-mode
                       clojure-test-mode
                       diminish
                       exec-path-from-shell
                       erlang
                       frame-restore
                       rainbow-mode
                       go-mode
                       projectile
                       protobuf-mode
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
