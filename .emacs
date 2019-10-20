;; (setq mac-control-modifier 'control)
;; (setq mac-command-modifier 'meta)
;; (setq mac-right-option-modifier 'control)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

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
 '(custom-safe-themes
   (quote
	("b6f06081b007b57be61b82fb53f27315e2cf38fa690be50d6d63d2b62a408636" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "da538070dddb68d64ef6743271a26efd47fbc17b52cc6526d932b9793f92b718" "9b1c580339183a8661a84f5864a6c363260c80136bd20ac9f00d7e1d662e936a" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(color-theme-modern auto-complete-c-headers command-log-mode auto-complete magit smart-tabs-mode airline-themes electric-spacing paredit autopair tabbar-ruler tabbar use-package-el-get color-theme-approximate diminish rainbow-delimiters color-identifiers-mode use-package helm evil-visual-mark-mode)))
 '(tabbar-separator (quote (0.2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
	  backup-by-copying t
	  version-control t
	  delete-old-versions t
	  kept-new-versions 20
	  kept-old-versions 5)

(require 'evil)
(evil-mode t)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("yellow" box))
(setq evil-visual-state-cursor '("magenta" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-replace-state-cursor '("red" hollow))
(setq evil-operator-state-cursor '("red" hollow))


(require 'tabbar)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-k") 'tabbar-backward)
(global-set-key (kbd "M-j") 'tabbar-forward)
(global-set-key [backtab] "\t")

(use-package tabbar
  :ensure t
  :bind

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
(evil-leader/set-key "w" 'kill-buffer)

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
(display-time-mode t)

(require 'airline-themes)
(load-theme 'airline-raven)

(require 'color-identifiers-mode)
(global-color-identifiers-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)

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

;; (require 'electric-spacing)
;; (add-hook 'c-mode-hook #'electric-spacing-mode)

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
							 (or (getenv "CC") "gcc")
							 (buffer-name)
							 (or (getenv "CFLAGS") "-Wall -Wextra -Werror -g3")
							       ))))))

(setq compilation-finish-function
(lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
        ;;no errors, make the compilation window go away in a few seconds
        (progn
          (run-at-time
           "2 sec" nil 'delete-windows-on
           (get-buffer-create "*compilation*"))
          (message "")))))

(defun exec-f9 ()
  (interactive)
  (defvar comp)
  (when (string= (file-name-extension buffer-file-name) "c")
	;; tmp (setq comp (concat "gcc -Wall -Wextra -Werror -g3 " (buffer-name))))
	(setq comp (concat "make -j4 run")))
  (when (string= (file-name-extension buffer-file-name) "cpp")
	(setq comp (concat "g++ -Wall -Wextra -Werror -g3 " (buffer-name))))
  (compile comp)
  (compilation-finish-function))

(defun exec-f10 ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (defvar exec)
  (setq exec "./a.out; echo \"~>\n$?\n\n.emacs v0.4-beta by Joe\"; rm a.out; rm -rf a.out.dSYM;")
  (shell-command exec))

(global-set-key [f9]  'exec-f9)
(global-set-key [f10] 'exec-f10)
