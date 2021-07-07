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
                    ;; --- evil ---
                    evil
                    evil-leader
                    evil-escape
		    evil-terminal-cursor-changer
                    ;; --- Major Mode ---
                    markdown-mode
                    ))

(setq package-selected-packages gddl/packages)

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

;; 文件末尾
(provide 'init-packages)


