;; enable recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings 'meta)

;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )

;;; Sets up windmove to swap between buffers with ctrl + hjkl
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k")    'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(evil-mode 1)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;;; space and delete to move
(define-key evil-normal-state-map (kbd "SPC")
  (lambda () (interactive) (next-line 10)))

(define-key evil-normal-state-map (kbd "DEL")
  (lambda () (interactive) (previous-line 10)))

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; easy open emacsrc
(global-set-key (kbd "C-c C-e") (lambda () (interactive) (find-file "~/.emacs.d/personal/init.el")))

;;; Indent when hitting enter
(global-set-key (kbd "RET") 'newline-and-indent)

;;; Add easy compile binding
(global-set-key (kbd "C-c C-c") 'compile)

;;; docs?
(require 'c-eldoc) (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;; enable flycheck!
(add-hook 'after-init-hook #'global-flycheck-mode)


;;; ==============================================
;;;   Mode specific bindings
;;; ==============================================

;;; ---- Rust Mode ----
(defvar flycheck-rust-library-path)
(set 'flycheck-rust-library-path '("libs/" ".."))


;;; ==============================================
;;;   File type -> mode bindings
;;; ==============================================
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))

;;; ==============================================
;;;   Colors
;;; ==============================================
(disable-theme 'zenburn)
(load-theme 'solarized-light)


;;; ==============================================
;;;   Highlight characters after 200 columns
;;; ==============================================
(require 'whitespace)
(setq whitespace-line-column 200) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'handlebars-sgml-mode)

(provide 'init)
;;; init.el ends here
