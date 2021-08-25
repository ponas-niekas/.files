;;; package --- My Config

; Key Name    Keyboard
;----------------------
; M   Meta    Alt
; A   Meta    Alt
; C   Control Ctrl
; S   Shift   Shift
; SPC Space   Space

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-list '(elpy
                     web-mode
                     highlight-thing
                     expand-region
                     autopair
                     neotree
                     git-gutter
                     duplicate-thing
                     monokai-theme
                     undo-tree
                     helm-swoop
                     flycheck
                     better-defaults
                     use-package
                     smart-mode-line-powerline-theme
                     counsel
                     counsel-tramp
                     shell-pop
                     cheatsheet
                     dashboard
                     multiple-cursors
                     nix-mode
                     json-mode
                     python-mode
                     xclip))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
      (package-install package)))

(require 'web-mode)
(require 'duplicate-thing)
(require 'highlight-thing)
(require 'expand-region)
(require 'autopair)
(require 'helm)
(require 'helm-config)
(require 'counsel)
(require 'counsel-tramp)
(require 'shell-pop)
(require 'cheatsheet)
(require 'multiple-cursors)
(require 'dashboard)

(setq default-directory "~/")
(setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 10)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-set-key [f12] 'cheatsheet-show)
(cheatsheet-add-group '"F'ing keys"
                      '(:key "F12" :description "Toggle cheatsheet buffer")
                      '(:key "F11" :description "Show shell window")
                      '(:key "F10" :description "Multi edit under cursor")
                      '(:key "F9" :description "Remote/ssh edit")
                      '(:key "F8" :description "Expand region")
                      '(:key "F7" :description "Contract region")
                      '(:key "F6" :description "Highlight at cursor")
                      '(:key "F5" :description "Undo Tree, q to exit")
                      '(:key "F4" :description "(Un)comment")
                      '(:key "F3" :description "Go to line")
                      '(:key "F2" :description "Open a file")
                      '(:key "F1" :description "Switch to a buffer"))

(cheatsheet-add-group '"Windows"
                      '(:key "C-c up/down/etc" :description "Switch to another window")
                      '(:key "C-c k" :description "Kill current window")
                      '(:key "C-c +" :description "Enlarge window")
                      '(:key "C-c -" :description "Shrink window"))

(cheatsheet-add-group '"Search"
                      '(:key "C-s" :description "Search")
                      '(:key "M-i" :description "Search under cursor")
                      '(:key "M-." :description "Jump to Definition"))

(cheatsheet-add-group '"Basic"
                      '(:key "C-x" :description "Cut")
                      '(:key "C-c" :description "Copy")
                      '(:key "C-v" :description "Paste")
                      '(:key "S-middle" :description "Mouse paste from X")
                      '(:key "C-g" :description "Cancel")
                      '(:key "C-x C-s" :description "Save")
                      '(:key "C-x C-c" :description "Exit"))

(cheatsheet-add-group '"Manipulate"
                      '(:key "C-d" :description "Duplicate line/region")
                      '(:key "M-up/down" :description "Move line/region")
                      '(:key "C-z or F5" :description "Undo")
                      '(:key "C-c C-r f" :description "Format code")
                      '(:key "M-left/right" :description "To indent")
                      '(:key "C-f" :description "Toggle folding")
                      '(:key "C-c C-m" :description "multiple-cursors"))


(defvar cheatsheet-visible t "Check if help buffer is visible")

(defun toggle-cheatsheet ()
  (interactive)
  (setq cheatsheet-visible (not cheatsheet-visible))
  (if cheatsheet-visible
      (kill-buffer-and-window)
    (cheatsheet-show)))

(global-set-key [f12] 'toggle-cheatsheet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [f11] 'shell-pop)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ab564a7ce7f2b2ad9e2cfe9fe1019b5481809dd7a0e36240c9139e230cc2bc32" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(package-selected-packages
   '(multiple-cursors yapfify dashboard cheatsheet counsel-tramp highlight-thing python-mode use-package better-defaults flycheck helm-swoop undo-tree monokai-theme git-gutter elpy duplicate-thing))
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   '("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell))))
 '(shell-pop-term-shell "~/.nix-profile/bin/zsh")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f9] 'counsel-tramp)
(setq counsel-tramp-localhost-directory "/home/ast")
(setq make-backup-files nil)
(setq create-lockfiles nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f8] 'er/expand-region)
(global-set-key [f7] 'er/contract-region)

(global-set-key [f10] 'elpy-multiedit)

(setq tramp-default-method "ssh")
(setq tramp-inline-compress-start-size 10000000)
(setq tramp-terminal-type "dumb")
;; (customize-set-variable 'tramp-default-user "lauris")

(global-set-key [f6] 'highlight-thing-mode)

(load-theme 'monokai t)

;; ToDo: solve moving line/region up and down....
(global-set-key (kbd "ESC <up>")    'elpy-nav-move-line-or-region-up)
(global-set-key (kbd "ESC <down>")  'elpy-nav-move-line-or-region-down)
(global-set-key (kbd "ESC <left>")  'elpy-nav-indent-shift-left)
(global-set-key (kbd "ESC <right>") 'elpy-nav-indent-shift-right)

(global-display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;; WEB ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
 
(setq web-mode-enable-current-element-highlight t)
(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face "#B22222"))
(set-face-attribute 'web-mode-html-tag-bracket-face  nil :foreground "#AAA")
(local-set-key (kbd "RET") 'newline-and-indent)

;;;;;;;;;;;;;;;;;;;;;;;;; python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(elpy-enable)
(multiple-cursors-mode)
(global-set-key (kbd "C-c C-m") 'set-rectangular-region-anchor)

(setq python-indent-guess-indent-offset-verbose nil)
(setq-default indent-tabs-mode nil)

(add-hook 'python-mode-hook
     (lambda ()
        (setq tab-width 4)
        (setq python-indent-offset 4)
        (setq-default show-trailing-whitespace t)))

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(add-hook 'elpy-mode-hook (lambda () (hs-minor-mode)))

(setq python-shell-interpreter "ipython" python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

(global-git-gutter-mode +1)

(global-set-key (kbd "C-d") 'duplicate-thing) ; duplicate a region/selection
(global-set-key (kbd "C-f") 'hs-toggle-hiding) ; toggle folding


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cua-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(xclip-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo tree mode                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;turn on everywhere
(global-undo-tree-mode 1)

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(global-set-key [f5] 'undo-tree-visualize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun comment-current-line-or-region ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))

 (global-set-key [f4] 'comment-current-line-or-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key [f3] 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Vertical split

;; (defun my-helm-buffers-list ()
;;   (interactive)
;;   (let ((helm-split-window-default-side 'left))
;;     (helm-buffers-list)))
;; (global-set-key [f1] 'my-helm-buffers-list)

(global-set-key [f1] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(xterm-mouse-mode 1)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(global-set-key [C-mouse-4] 'gcm-scroll-up)
(global-set-key [C-mouse-5] 'gcm-scroll-down)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1)

(setq term-char-mode-buffer-read-only nil)
(setq term-char-mode-point-at-process-mark nil)

(setq mouse-drag-copy-region t)
(setq mouse-yank-at-point t)
(setq select-active-regions 'only)
(setq select-enable-primary t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq helm-autoresize-max-height 25)
(setq helm-autoresize-min-height 25)
(helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key [f2]            'helm-find-files)
(global-set-key (kbd "C-s") 'helm-swoop-without-pre-input)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(setq helm-swoop-split-with-multiple-windows t)
;; (setq helm-swoop-split-direction 'split-window-horizontally)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq sml/no-confirm-load-theme t)
(smart-mode-line-enable t)

(global-flycheck-mode)
(show-paren-mode 1)
(menu-bar-mode -1)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq column-number-mode t)

(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-foreground 'line-number "#5d6365")
(set-face-background 'line-number "#2b2f31")
(set-face-foreground 'line-number-current-line "#000000")
(set-face-background 'line-number-current-line "#888888")

(setq python-shell-completion-native-disabled-interpreters '("python"))


(global-set-key [next]
    (lambda () (interactive)
        (condition-case nil (scroll-up)
            (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
    (lambda () (interactive)
        (condition-case nil (scroll-down)
            (beginning-of-buffer (goto-char (point-min))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1)
  (next-line))

(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1)
  (previous-line))

;; (global-set-key [(control down)] 'gcm-scroll-down)
;; (global-set-key [(control up)]   'gcm-scroll-up)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c k")       'delete-window)
(global-set-key (kbd "C-c +")       'enlarge-window)
(global-set-key (kbd "C-c -")       'shrink-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "red")))))

(defadvice terminal-init-screen
  ;; The advice is named `tmux', and is run before `terminal-init-screen' runs.
  (before tmux activate)
  ;; Docstring.  This describes the advice and is made available inside emacs;
  ;; for example when doing C-h f terminal-init-screen RET
  "Apply xterm keymap, allowing use of keys passed through tmux."
  ;; This is the elisp code that is run before `terminal-init-screen'.
  (if (getenv "TMUX")
    (let ((map (copy-keymap xterm-function-map)))
    (set-keymap-parent map (keymap-parent input-decode-map))
    (set-keymap-parent input-decode-map map))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-default 'truncate-lines t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Show "empty" lines with unessary spaces

(setq whitespace-style '(face tabs tab-mark trailing))

(global-whitespace-mode) ; Enable whitespace mode everywhere

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
