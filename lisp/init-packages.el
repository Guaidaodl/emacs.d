;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                             ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar gddl/packages '(
                    use-package
                    ;; --- Auto-completion ---
                    company
                    ;; --- Better Editor ---
                    all-the-icons
                    monokai-theme
                    neotree
                    exec-path-from-shell
                    ;; --- evil ---
                    evil
                    evil-leader
                    evil-escape
                    evil-terminal-cursor-changer
                    ;; --- Major Mode ---
                    markdown-mode
                    ))

;;(setq package-selected-packages gddl/packages)

;; 判断是不是所有指定的 package 都已经安装完成了.
(defun gddl/packages-installed-p ()
  (loop for pkg in gddl/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)))

(unless (gddl/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg gddl/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-company-mode 1)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(unless (display-graphic-p)
  ;; 启用插件, 在命令行下不同模式使用不同的光标样式
  (evil-terminal-cursor-changer-activate) 
)

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))


;; 彩虹括号, 只在 prog-mode 才开.
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; git
(use-package magit
  :ensure t)

;; 编程模式的扩展

;; kotlin
(use-package kotlin-mode
  :ensure t)

;; 文件末尾
(provide 'init-packages)


