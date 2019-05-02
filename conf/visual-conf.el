
;;; VISUAL

;; disable startup screen
(setq inhibit-startup-screen t)

(setq column-number-mode t)

;;; Blink mode line
(setq visible-bell nil)
;; Why was this here? nil
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))
(lambda nil (invert-face (quote mode-line)) (run-with-timer 0.1 nil (quote invert-face) (quote mode-line)))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(setq-default cursor-type '(hbar . 10))
(tool-bar-mode 0)
(blink-cursor-mode 1)

(setq indent-tabs-mode nil)
(show-paren-mode t)
(electric-pair-mode t)
(setq nxml-child-indent 4)

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 8)            ;; but maintain correct appearance

;; delete the selection with a keypress
;; (delete-selection-mode t)

;;Fonts
(set-default-font "Inconsolata-18")

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; highlight the current line
(global-hl-line-mode +1)

;; sensible undo
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

(require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

(require 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)

(load-theme 'adwaita t)

(require 'nyan-mode)
(nyan-mode)
