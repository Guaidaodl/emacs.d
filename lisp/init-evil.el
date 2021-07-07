;; --- evil 相关的配置

;; 需要先启用 evil-leader-mode 再启用 evil-mode
(global-evil-leader-mode)
(evil-mode 1)
(evil-escape-mode)

(setq-default evil-escape-key-sequence "fd")
(evil-leader/set-leader "<SPC>")

(provide 'init-evil)
