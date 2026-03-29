;;;; Code: .emacs

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(set-frame-font "Liberation Mono-16" nil t)

;; archives
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; themes
(use-package solarized-theme :ensure t)
(use-package organic-green-theme)
(load-theme 'solarized-selenized-dark t)


(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl --dynamic-space-size 2000"))
(use-package magit :ensure t)
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))
(use-package dired-subtree :ensure t)

;; Lisp
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
  (add-hook 'edn-hook                   #'enable-paredit-mode))



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
