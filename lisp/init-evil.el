;; --- evil 相关的配置
(use-package evil-leader
  :ensure t)

(use-package evil-escape
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (global-evil-leader-mode) ; 需要先启用 evil-leader-mode 再启用 evil-mode
  (evil-mode 1)
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "fd")
  (evil-leader/set-leader "<SPC>")
  )

(use-package evil-terminal-cursor-changer
  :ensure t
  :config
  (unless (display-graphic-p)
    ;; 启用插件, 在命令行下不同模式使用不同的光标样式
    (evil-terminal-cursor-changer-activate)))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(provide 'init-evil)
