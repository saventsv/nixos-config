(use-package evil
 :ensure t
 :demand t
 :init
 (setq evil-want-integration t)
 (setq evil-want-keybinding nil)
 (setq evil-want-C-u-scroll t)
 :config
 (evil-mode 1))

(use-package evil-collection
 :after evil
 :ensure t
 :demand t
 :config
 (evil-collection-init))

(use-package markdown-mode
 :ensure t
 :demand t
 :mode ("\\.md\\'" . markdown-mode)
 :init
 ;; Disable header scaling since the terminal grid does not natively support text resizing
 (setq markdown-header-scaling nil)

 ;; Hide raw markup markers (** or _ ) and links until the cursor selects them
 (setq markdown-hide-markup t)
 (setq markdown-hide-urls t)

 :config
 ;; Custom color styling matching your terminal theme
 (custom-theme-set-faces
  'user
  ;; Gives inline `code` blocks an obvious distinct color background
  '(markdown-inline-code-face ((t (:background "#2e3440" :foreground "#88c0d0"))))
  ;; Standard terminal headings will stand out distinctly using Bolding
  '(markdown-header-face-1 ((t (:weight bold))))
  '(markdown-header-face-2 ((t (:weight bold))))
  '(markdown-header-face-3 ((t (:weight bold))))))

(use-package emacs
 :init
 ;; Enable relative line numbering globally across all programming/text modes
 (setq display-line-numbers-type 'relative) 
 (global-display-line-numbers-mode 1)
 (setq create-lockfiles nil)

(setq backup-directory-alist
  `(("." . ,(expand-file-name ".garbage/backups/" user-emacs-directory))))

(setq auto-save-file-name-transforms
  `((".*" ,(expand-file-name ".garbage/auto-saves/" user-emacs-directory) t)))

(setq auto-save-list-file-prefix
  (expand-file-name ".garbage/auto-save-list/.saves-" user-emacs-directory))
 

 (menu-bar-mode -1)

 ;; Explicitly turn off other GUI layout bars just in case you ever launch out of terminal
 (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
 (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

 ;; Optional: Don't show line numbers in terminal dashboard or shell buffers
 (dolist (mode '(org-agenda-mode-hook
                 eshell-mode-hook
                 shell-mode-hook
                 term-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)))))

(use-package dired
 :ensure nil ; Built-in, no download needed
 :custom
 ;; Always auto-refresh dired buffers when files change on disk
 (dired-auto-revert-buffer t)
 ;; Human-readable file sizes and hide group details to keep it minimal
 (dired-listing-switches "-agho --group-directories-first")
 :config
 ;; Use the '-' key globally to open the file manager at the current file's path
 (define-key evil-normal-state-map (kbd "-") 
  (lambda () (interactive) (dired default-directory)))

 ;; Custom keymaps inside the file explorer buffer
 (evil-collection-define-key 'normal 'dired-mode-map
  "-" 'dired-up-directory                ; '-' goes up to parent directory
  (kbd "RET") 'dired-find-file           ; Enter opens file/folder
  "i" 'wdired-change-to-wdired-mode))    ; 'i' puts buffer into "writable oil mode"

(use-package wdired
 :ensure nil ; Built-in
 :config
 ;; Custom keymaps when actively rewriting files in Writable mode
 (evil-collection-define-key 'normal 'wdired-mode-map
  (kbd "Z Z") 'wdired-finish-edit       ; 'ZZ' saves your filesystem changes
  (kbd "Z Q") 'wdired-abort-changes))   ; 'ZQ' cancels updates
