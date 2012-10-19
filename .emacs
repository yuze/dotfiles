(global-font-lock-mode t)

(unless (fboundp 'prog-mode) (defalias 'prog-mode 'fundamental-mode))
;; .emacs
(require 'web-mode) 
(require 'js2-mode) 
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$" . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
;(require 'css-mode) 

; インデント
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)

;(require 'php-mode)
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(autoload 'css-mode "css-mode")
;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.ctp$" . html-helper-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

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

(show-paren-mode t)

(transient-mark-mode t)
