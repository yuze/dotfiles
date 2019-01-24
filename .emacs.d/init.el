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
(setq default-tab-width 4)
(setq frame-title-format (concat  "%b - emacs@" (system-name)))
(setq diff-switches "-u")
(menu-bar-mode -1)
(show-paren-mode t)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\C-g" 'goto-line)

;; packages
;;; web-mode
(straight-use-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(defun web-mode-hook ()
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)

;;; js2-mode
(straight-use-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;; helm
(straight-use-package 'helm)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

;;; recentf
(straight-use-package 'recentf-ext)
(setq recentf-max-saved-items 100)
(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        helm-source-bookmark-set
        helm-source-locate))

;;; migmo
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

;;; migemo + swiper
(straight-use-package 'avy)
(straight-use-package 'swiper-helm)
(straight-use-package 'avy-migemo)
(avy-migemo-mode 1)
(require 'avy-migemo-e.g.swiper)
;;; swiper
(global-set-key "\C-s" 'swiper)
(defvar swiper-include-line-number-in-search t)

;;; company
(straight-use-package 'company)
(global-company-mode)
(setq company-transformers '(company-sort-by-backend-importance))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
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

