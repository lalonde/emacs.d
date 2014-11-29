(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;; (setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.

(global-set-key [M-s-left] 'tabbar-backward)
(global-set-key [M-s-right] 'tabbar-forward)
(global-set-key [M-s-up] 'tabbar-forward-group)
(global-set-key [M-s-down] 'tabbar-backward-group)

(defun tabbar-ruler-remove-caches
    (mapc #'(lambda (frame)
              (modify-frame-parameters frame '((tabbar-cache . nil))))
          (frame-list)))

(add-hook 'desktop-after-read-hook 'tabbar-ruler-remove-caches)

(require 'tabbar-ruler)
