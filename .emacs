(setq mac-control-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-right-option-modifier 'control)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/1"))

(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(color-theme electric-spacing paredit autopair tabbar-ruler tabbar use-package-el-get color-theme-approximate diminish rainbow-delimiters color-identifiers-mode use-package helm evil-visual-mark-mode)))
 '(tabbar-separator (quote (0.2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)

(require 'evil)
(evil-mode t)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("yellow" box))
(setq evil-visual-state-cursor '("magenta" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-replace-state-cursor '("red" hollow))
(setq evil-operator-state-cursor '("red" hollow))

(use-package tabbar
  :ensure t
  :bind
  ("<C-k>" . tabbar-backward-tab)
  ("<C-j>" . tabbar-forward-tab)

  :config
  (set-face-attribute
   'tabbar-button nil
   :box '(:line-width 1 :color "gray19"))

  (set-face-attribute
   'tabbar-selected nil
   :foreground "orange"
   :background "gray19"
   :box '(:line-width 1 :color "gray19"))

  (set-face-attribute
   'tabbar-unselected nil
   :foreground "gray75"
   :background "gray25"
   :box '(:line-width 1 :color "gray19"))

  (set-face-attribute
   'tabbar-highlight nil
   :foreground "black"
   :background "orange"
   :underline nil
   :box '(:line-width 1 :color "gray19" :style nil))

  (set-face-attribute
   'tabbar-modified nil
   :foreground "orange red"
   :background "gray25"
      :box '(:line-width 1 :color "gray19"))
  (set-face-attribute
   'tabbar-selected-modified nil
   :foreground "orange red"
   :background "gray19"
   :box '(:line-width 1 :color "gray19"))

  (custom-set-variables
   '(tabbar-separator (quote (0.2))))

  ;; Change padding of the tabs
  ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
  ;; (custom-set-variables
  ;;  '(tabbar-separator (quote (1.0))))
  (defun tabbar-buffer-tab-label (tab)
        "Return a label for TAB.
  That is, a string used to represent it on the tab bar."
	(let ((label  (if tabbar--buffer-show-groups
			  (format " [%s] " (tabbar-tab-tabset tab))
			(format " %s " (tabbar-tab-value tab)))))
	  ;; Unless the tab bar auto scrolls to keep the selected tab
	  ;; visible, shorten the tab label to keep as many tabs as possible
	  ;; in the visible area of the tab bar.
	  (if tabbar-auto-scroll-flag
	      label
	    (tabbar-shorten
	     label (max 1 (/ (window-width)
			     (length (tabbar-view
				      (tabbar-current-tabset)))))))))

  (defun px-tabbar-buffer-select-tab (event tab)
    "On mouse EVENT, select TAB."
    (let ((mouse-button (event-basic-type event))
	  (buffer (tabbar-tab-value tab)))
      (cond
       ((eq mouse-button 'mouse-2) (with-current-buffer buffer (kill-buffer)))
       ((eq mouse-button 'mouse-3) (pop-to-buffer buffer t))
       (t (switch-to-buffer buffer)))
      (tabbar-buffer-show-groups nil)))

  (defun px-tabbar-buffer-help-on-tab (tab)
    "Return the help string shown when mouse is onto TAB."
    (if tabbar--buffer-show-groups
	(let* ((tabset (tabbar-tab-tabset tab))
	       (tab (tabbar-selected-tab tabset)))
	  (format "mouse-1: switch to buffer %S in group [%s]"
		  (buffer-name (tabbar-tab-value tab)) tabset))
            (format "\
mouse-1: switch to %S\n\
mouse-2: kill %S\n\
mouse-3: Open %S in another window"
		    (buffer-name (tabbar-tab-value tab))
		    (buffer-name (tabbar-tab-value tab))
		    (buffer-name (tabbar-tab-value tab)))))

  (defun px-tabbar-buffer-groups ()
    "Sort tab groups."
    (list (cond ((or
		  (eq major-mode 'dired-mode)
		  (string-equal "*" (substring (buffer-name) 0 1))) "emacs")
		(t "user"))))
  (setq tabbar-help-on-tab-function 'px-tabbar-buffer-help-on-tab
	tabbar-select-tab-function 'px-tabbar-buffer-select-tab
	tabbar-buffer-groups-function 'px-tabbar-buffer-groups)

  :init
    (tabbar-mode 1))

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)

(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist 1)

(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "M-x") 'helm-M-x)

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(global-display-line-numbers-mode)

(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-c-source-buffers-list
			 helm-c-source-elscreen
			 helm-c-source-projectile-files-list
			 helm-c-source-ctags
			 helm-c-source-recentf
			 helm-c-source-locate)
		       "*helm-my-buffers*")))

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

(require 'color-identifiers-mode)
(global-color-identifiers-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq-default indent-tabs-mode t)
(setq tab-always-indent t)
(setq-default tab-width 4)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(setq c-default-style "bsd")

(require 'autopair)
(autopair-global-mode)

(require 'paredit)
(defadvice paredit-mode (around disable-autopairs-around (arg))
  ad-do-it
  (if (null ad-return-value)
    (autopair-mode 1)
  (autopair-mode 0)
))
(ad-activate 'paredit-mode)

(require 'electric-spacing)
(add-hook 'c-mode-hook #'electric-spacing-mode)
(add-hook 'c-mode-hook
		  (lambda ()
			(unless (file-exists-p "Makefile")
			  (set (make-local-variable 'compile-command)
				   ;; emulate make's .c.o implicit pattern rule, but with
				   ;; different defaults for the CC, CPPFLAGS, and CFLAGS
				   ;; variables:
				   ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
				   (let ((file (file-name-nondirectory buffer-file-name)))
					 (format "%s %s %s -o a.out"
							 (or (getenv "CC") "clang")
							 (buffer-name)
							 (or (getenv "CFLAGS") "-Wall -Wextra -Werror -g3")
							       ))))))

(defun exec-c-f9 ()
  (interactive)
  (defvar comp)
  (setq comp (concat "clang -Wall -Wextra -Werror -g3 " (buffer-name)))
  (compile comp))

(defun exec-c-f10 ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (defvar exec)
  (setq exec "./a.out; echo \"~> $?\n\n.emacs v1.1-beta by Joe\"; rm a.out;")
  (shell-command exec))

(global-set-key [f9] 'exec-c-f9)
(global-set-key [f10] 'exec-c-f10)
