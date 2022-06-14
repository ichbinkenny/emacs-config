(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dashboard treemacs-all-the-icons treemacs-icons-dired treemacs-magit treemacs-projectile all-the-icons dap-mode which-key lsp-ui lsp-mode company-tabnine company flycheck apheleia yasnippet-snippets yasnippet undo-fu-session rainbow-delimiters projectile magit doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'doom-dracula t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-frame-fullscreen)

;; Setup magit
(unless (package-installed-p 'magit)
  (package-install 'magit))
(global-set-key (kbd "C-c g") 'magit-file-dispatch)

;; Setup projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode 1)

;; Setup rainbow delims for easier paren and brace matching
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; CRUX (a nice collection of emacs extensions) setup
(unless (package-installed-p 'crux)
  (package-install 'crux))

(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
(global-set-key (kbd "C-c I") 'crux-find-user-init-file)
(global-set-key (kbd "S-k") 'crux-kill-whole-line)
(global-set-key (kbd "M-o") 'crux-other-window-or-switch-buffer)

;; Undo-Fu for better undo functionality
(unless (package-installed-p 'undo-fu-session)
  (package-install 'undo-fu-session))

(global-undo-fu-session-mode)

;; YASnippet for faster typing
(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

;; Don't forget snippets!
(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))

(require 'yasnippet)
(yas-global-mode 1)

;; Nice code formatting that isnt slow!
(unless (package-installed-p 'apheleia)
  (package-install 'apheleia))
(apheleia-global-mode 1)

;; Flycheck for syntax stuff
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

;; Setup company mode
(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)

;; Add tabnine for AI assisted coding joy
(unless (package-installed-p 'company-tabnine)
  (package-install 'company-tabnine))
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
;; A few company settings for better tabnine experience
(setq company-idle-delay 0)
(setq company-show-numbers t)
;; Don't forget to install Tabnine! (M-x company-tabnine-install-binary

;; Add LSP integration to client
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))

;; which key to show possible key bindings
(unless (package-installed-p 'which-key)
  (package-install 'which-key))
(require 'which-key)
(which-key-mode 1)

;; DAP mode for debugging
(unless (package-installed-p 'dap-mode)
  (package-install 'dap-mode))
;; add hook for breakpoints
(add-hook 'dap-stopped-hook
	  (lambda (arg) (call-interactively #'dap-hydra)))
(setq dap-auto-configure-features '(sessions locals controls tooltip))

;; Add lldb dap for C, C++, Swift, Rust
(require 'dap-gdb-lldb)

;; Add support for Golang
(require 'dap-dlv-go)

;; All the icons for ALLTEHICONZ
(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))
(when (display-graphic-p)
  (require 'all-the-icons))

;; Add treemacs for nice project file management
(unless (package-installed-p 'treemacs)
  (package-install 'treemacs))
(global-set-key (kbd "C-c ;") 'treemacs)
;; And add projectile support
(unless (package-installed-p 'treemacs-projectile)
  (package-install 'treemacs-projectile))
;; Add magit support
(unless (package-installed-p 'treemacs-magit)
  (package-install 'treemacs-magit))
;; Better icons for Dired
(unless (package-installed-p 'treemacs-icons-dired)
  (package-install 'treemacs-icons-dired))
;; All the icons for treemacs
(unless (package-installed-p 'treemacs-all-the-icons)
  (package-install 'treemacs-all-the-icons))

;; Better dashboard
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
