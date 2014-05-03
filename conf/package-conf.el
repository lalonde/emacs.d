;;; PACKAGES
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package))))
 '(ample-zen-theme auto-complete exec-path-from-shell erlang frame-restore rainbow-mode go-mode protobuf-mode undo-tree diminish yasnippet smartparens smex tabbar tabbar-ruler volatile-highlights))
