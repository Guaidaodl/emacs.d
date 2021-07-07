(define-key evil-normal-state-map (kbd "C-t") 'neotree-toggle)

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

(provide 'init-keybinding)
