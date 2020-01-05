(require 'org)
(org-babel-load-file
 (expand-file-name "org/config.org"
				   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("k84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" "b6f06081b007b57be61b82fb53f27315e2cf38fa690be50d6d63d2b62a408636" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "da538070dddb68d64ef6743271a26efd47fbc17b52cc6526d932b9793f92b718" "9b1c580339183a8661a84f5864a6c363260c80136bd20ac9f00d7e1d662e936a" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(frame-local ov dash-functional helm-addressbook org-mime flyspell-correct pdf-tools el-get websocket request emojify-logos emojify oauth2 circe mu4e-alert web-mode doom-themes doom-modeline all-the-icons-dired all-the-icons-gnus all-the-icons html5-schema phps-mode org-babel-eval-in-repl rust-mode smart-mode-line-powerline-theme eshell-prompt-extras eshell-fixed-prompt pyenv-mode s realgud-lldb neotree ranger ## color-theme-modern auto-complete-c-headers command-log-mode auto-complete magit smart-tabs-mode airline-themes paredit autopair tabbar-ruler tabbar use-package-el-get color-theme-approximate diminish rainbow-delimiters color-identifiers-mode use-package helm evil-visual-mark-mode)))
 '(send-mail-function (quote smtpmail-send-it))
 '(tabbar-separator (quote (0.2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "color-27"))))
 '(helm-selection ((t (:background "color-177" :distant-foreground "black" :foreground "black" :weight semi-bold))))
 '(highlight ((t (:background "color-235" :weight semi-bold))))
 '(magit-section-highlight ((t (:background "color-237"))))
 '(minibuffer-prompt ((t (:foreground "color-33"))))
 '(mu4e-highlight-face ((t (:weight bold))))
 '(neo-dir-link-face ((t (:foreground "Blue"))))
 '(neo-file-link-face ((t (:foreground "color-252"))))
 '(neo-vc-default-face ((t (:foreground "color-251"))))
 '(neo-vc-up-to-date-face ((t (:foreground "green"))))
 '(region ((t (:background "color-235"))))
 '(smerge-lower ((t (:background "yellow"))))
 '(smerge-markers ((t (:background "color-58"))))
 '(smerge-upper ((t (:background "brightcyan"))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray25" :foreground "gray50" :height 0.8)))))
