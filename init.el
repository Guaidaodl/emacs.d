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

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; 彩虹括号, 只在 prog-mode 才开.
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package kotlin-mode)

(use-package monokai-theme
  :config
  (load-theme 'monokai t)
  )

(require 'init-evil)
; (require 'init-packages)
; (require 'init-keybinding)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(monokai-theme kotlin-mode rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
