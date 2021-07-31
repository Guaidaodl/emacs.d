(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-better-defaults)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/packages/use-package")
  (require 'use-package)
  )

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(require 'package)
(setq package-archives 
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/") 
        ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; 主题
(use-package monokai-theme
  :config
  (load-theme 'monokai t)
  )

;; evil 基础包
(require 'init-evil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;扩展功能的包
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :config
  ;; Use additional padding between columns of keys. This variable specifies the
  ;; number of spaces to add to the left of each column.
  (setq which-key-add-column-padding 10)
  (setq which-key-max-display-columns 6)
  (setq which-key-separator " → ")
  (setq which-key-unicode-correction 3)
  (which-key-mode)
  )

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; company
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; 项目管理
(use-package projectile
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :after (projectile helm))

;; helm
(use-package helm 
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (evil-leader/set-key
    "<SPC>" '("Run" . helm-M-x)
    "j" '("Jump" . (keymap))
    "jb" '("buffer" . helm-buffers-list)
    "jf" '("file" . helm-projectile-find-file))
  )

;; git
(use-package magit
  :config
  (evil-leader/set-key
    "g" '("Git" . (keymap))
    "gs" '("status" . magit-status)
    "gc" '("commit" . magit-commit)
    "gp" '("push" . magit-push)
    "gf" '("fetch" . magit-fetch)
    "gl" '("Log" . (keymap))
    "gll" '("current" . magit-log-current)
    "gla" '("all" . magit-log-all)
    "gli" '("interactive" . magit-log)
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 编程相关
;; 彩虹括号, 只在 prog-mode 才开.
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package groovy-mode)

(use-package kotlin-mode)

(use-package cmake-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 编程语言相关的配置

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq c-basic-offset 2)
	  ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(company cmake-mode helm-projectile projectile helm groovy-mode evil-surround monokai-theme kotlin-mode rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
