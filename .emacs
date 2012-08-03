(global-font-lock-mode t)

;; .emacs
(load-library "php-mode")
(require 'php-mode)

(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ctp$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq indent-tabs-mode nil)

; key bind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-x\C-i" 'indent-region)

; indent
(setq standard-indent 4)
(setq-default tab-width 4)


;no backup file
(setq backup-inhibited t)


;no backup file
(setq backup-inhibited t)

(show-paren-mode t)

(transient-mark-mode t)
