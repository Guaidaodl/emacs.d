;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 关闭自动保存的功能
(setq auto-save-default nil)

;; 关闭工具栏
(tool-bar-mode -1)

;; 命令行模式关闭菜单栏
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; 显示行号
(global-linum-mode 1)

;; 使用空格缩进.
(setq-default intent-tabs-mode nil)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭备份文件功能
(setq make-backup-files nil)

;; 默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮当前行
(global-hl-line-mode 1)

;; 更明显的搜索高亮
(set-face-attribute 'lazy-highlight nil :foreground "#484848" :background "#68F990")

;; 在 prog-mode 下的一些配置
(add-hook 'prog-mode-hook
	  (lambda ()
	    (setq truncate-lines t) ;; 禁止自动换行
	    (show-paren-mode) ;; 高亮匹配的括号
	    (set-face-foreground 'show-paren-match "#999999")
	    ))

;; 修改字体
(defun my-config-windows-font()
  (set-face-attribute 'default nil :font "Consolas" :height 140 :width 'normal)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t
                      charset
                      (font-spec :family "思源黑体" :size 18))))

(cond ((eq system-type 'windows-nt) (my-config-windows-font))
      ((eq system-type 'darwin)
       (setq default-frame-alist '((font . "FiraCode Nerd Font-16")))
       ))


;(load-theme 'monokai 1)

;; 打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)


;; 自动保存的功能
(require 'auto-save)
(auto-save-enable)

(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
