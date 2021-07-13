;; --- evil 相关的配置
(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil))

(use-package evil-leader
  :after evil)

(use-package evil-escape
  :after evil)

(use-package evil-config
  :load-path "lisp/evil-config.el"
  :after (evil evil-leader evil-escape)
  :config
  (global-evil-leader-mode) ; 需要先启用 evil-leader-mode 再启用 evil-mode
  (evil-mode 1)
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "fd")
  (evil-leader/set-leader "<SPC>")
  (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
  (define-key evil-normal-state-map (kbd "C-t") 'neotree-toggle) ;; 补充 neotree 相关
  (add-hook 'neotree-mode-hook
            (lambda () 
              (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look) 
              (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide) 
              (evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter) 
              (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh) 
              (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line) 
              (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line) 
              (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle) 
              (evil-define-key 'normal neotree-mode-map (kbd "I") 'neotree-hidden-file-toggle)))
  )

(use-package evil-terminal-cursor-changer
  :after evil
  :config
  (unless (display-graphic-p)
    ;; 启用插件, 在命令行下不同模式使用不同的光标样式
    (evil-terminal-cursor-changer-activate)))

;; evil 适配常用的插件
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  )


(provide 'init-evil)
