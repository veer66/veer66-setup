;;;; Code: .emacs

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

(use-package magit)
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize)
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(organic-green))
 '(custom-safe-themes
   '("d4c10d9b4f8c4a3787fb24a3c45fa64a867bfeecf7a612585d4af3d38b8a9746"
     "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
     default))
 '(package-selected-packages
   '(coderef dired-subtree exec-path-from-shell magit organic-green-theme
	     paredit sly solarized-theme))
 '(package-vc-selected-packages '((coderef :url "https://codeberg.org/veer66/coderef")))
 '(tab-bar-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "nil" :slant normal :weight regular :height 180 :width normal))))
 '(fill-column-indicator ((t (:foreground "#CCCCCC" :weight normal))))
 '(multi-magit-repo-heading ((t (:inherit magit-section-heading :box nil))))
 '(speedbar-selected-face ((t (:foreground "#119911" :underline t)))))


;; themes
(use-package solarized-theme :ensure t)
(use-package organic-green-theme :ensure t)

;;

(use-package dired-subtree :ensure t)


;; Lisp
(use-package paredit :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
  (add-hook 'edn-hook                   #'enable-paredit-mode))

(use-package sly :ensure t
  :init
  (progn 
    ;(setenv "XDG_CONFIG_HOME" "/home/vee/.config")
    ;(setenv "LD_RUN_PATH" "/run/host/lib/x86_64-linux-gnu")
    ;(setenv "LD_LIBRARY_PATH" "/run/host/lib/x86_64-linux-gnu")
    )
  :config
  (setq inferior-lisp-program "sbcl --dynamic-space-size 2000")
  ;;(setq inferior-lisp-program "ecl")
  ;;(setq inferior-lisp-program "/usr/bin/java -jar /home/vee/pkg/abcl-bin-1.9.2/abcl.jar")
  ;;(setq inferior-lisp-program "/home/vee/pkg/ccl/lx86cl64")
  )

;; Vee's
(use-package coderef
  :vc (:url "https://codeberg.org/veer66/coderef" :rev :newest))

(defun kill-all-sly-buffers ()
  (interactive)
  (cl-loop for buffer in (buffer-list)
	   when (string-match-p "sly" (buffer-name buffer))
	   do (kill-buffer buffer)))

;;; MAC

(when (and (eq system-type 'darwin) (display-graphic-p))
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'option))
