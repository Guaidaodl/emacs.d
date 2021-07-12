;; 关闭工具栏
(tool-bar-mode -1)

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

;; 在 prog-mode 下高亮匹配的括号
(add-hook 'prog-mode-hook #'show-paren-mode)

;; 修改字体
(defun my-config-windows-font()
  (set-face-attribute 'default nil :font "Consolas" :height 140 :width 'normal)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t 
                      charset 
                      (font-spec :family "思源黑体" :size 18))))

(seq-filter (lambda (font)
              (when-let ((info (font-info font)))
                (string-match-p "spacing=100" (aref info 1))))
            (font-family-list))

(cond ((eq system-type 'windows-nt) (my-config-windows-font))
      ((eq system-type 'darwin)
       (setq default-frame-alist '((font . "FiraCode Nerd Font-14")))
       ))


(load-theme 'monokai 1)

;; 打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(provide 'init-better-defaults)
