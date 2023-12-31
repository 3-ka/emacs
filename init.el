(setq inhibit-startup-message t)  ; Don't show the splash screen

;; Turn off some unneeded UI elements
(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;;(load-theme 'deeper-blue t)

(setq visible-bell t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(package-selected-packages
   '(magit projectile which-key all-the-icons rainbow-delimiters doom-modeline cider company helm zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)
;;Disable line numbers for some modes
(dolist (mode '(term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 100)
(load-theme 'zenburn)

(use-package helm
  :bind
  (("C-x b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ("C-s" . helm-occur)
   (:map helm-map
         ("TAB" . helm-execute-persistent-action)))
  :custom ((helm-split-window-in-side-p t)
	   (helm-move-to-line-cycle-in-source t)))
(helm-mode 1)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 30)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 1))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'helm))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/workspace")
    (setq projectile-project-search-path '("~/workspace")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;(use-package company
;;  :config
;;  (progn
;;    (add-hook 'after-init-hook 'global-company-mode)))

(use-package cider)
