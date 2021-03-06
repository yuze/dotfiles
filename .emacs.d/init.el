
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; basic setting
(prefer-coding-system 'utf-8)
(setq transient-mark-mode t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq default-tab-width 2)
(setq frame-title-format (concat  "%b - emacs@" (system-name)))
(setq diff-switches "-u")
(menu-bar-mode -1)
(show-paren-mode t)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\C-g" 'goto-line)

;; packages

;; helm-themes
(straight-use-package 'helm-themes)
(load-theme 'wombat t t)
(enable-theme 'wombat)

;; helm
(straight-use-package 'helm)
(helm-mode 1)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key helm-map (kbd "C-h") 'helm-ff-delete-char-backward)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; recentf
(straight-use-package 'recentf-ext)
(recentf-mode 1)
(setq recentf-max-saved-items 200)
(setq recentf-save-file "~/.emacs.d/recentf")
(setq recentf-auto-cleanup 'never)
(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        helm-source-bookmark-set
        helm-source-locate))

;; company
(straight-use-package 'company)
(global-company-mode)
(setq company-transformers '(company-sort-by-backend-importance))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map (kbd "C-f") 'company-complete-selection)
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

;; web-mode
(straight-use-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(defun web-mode-hook ()
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; php-mode
;(straight-use-package 'cl)
(straight-use-package 'php-mode)
(straight-use-package 'company-php)
(add-hook 'php-mode-hook
          '(lambda ()
             (company-mode t)
             (ac-php-core-eldoc-setup)
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))

;; js2-mode
(straight-use-package 'js2-mode)
(straight-use-package 'company-tern)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook 'tern-mode) 
(add-hook 'js2-mode-hook
          (lambda ()
             (setq my-js-mode-indent-num 2)
             (setq js2-basic-offset my-js-mode-indent-num)
             (setq js-switch-indent-offset my-js-mode-indent-num)
             ))

;; ruby
(setq url-proxy-services '(
			   ("no_proxy" . "127.0.0.1")
                           ("http" . "112.124.9.128:44433")
                           ;; ("https" . "")
                           ))
(setq ruby-insert-encoding-magic-comment nil)
(setq rbenv-installation-dir "~/.rbenv")

(straight-use-package 'ruby-mode)
(straight-use-package 'rbenv)
(straight-use-package 'robe)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
;(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'ruby-mode-hook 'rbenv-mode)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (company-mode t)
             (robe-mode t)
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-robe)))

;(eval-after-load 'company
;  '(push 'company-robe company-backends))

;;; flycheck
(straight-use-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; migmo
(straight-use-package 'migemo)
(straight-use-package 'helm-migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;; swiper
(global-set-key "\C-s" 'swiper)
(defvar swiper-include-line-number-in-search t)

;; migemo + swiper
(straight-use-package 'avy)
(straight-use-package 'swiper-helm)
(straight-use-package 'avy-migemo)
(avy-migemo-mode 1)
(require 'avy-migemo-e.g.swiper)
