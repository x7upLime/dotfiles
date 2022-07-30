;;(setq inhibit-startup-screen 1)
;; line number
(global-linum-mode)

;;move between windows (SHIFT+arrow)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; highlight current line
(global-hl-line-mode)

;; set "region" face || highlightment background color..
(set-face-attribute 'region nil :background "#df0")

;; char size
(set-face-attribute 'default nil :height 95)

;; Stop emacs from creating backups
(setq make-backup-files nil)


;; Personalizations/................
;;
;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(eglot json-mode markdown-mode go-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
;;
;;
;; sets PATH
(setenv "PATH" (concat (getenv "PATH") ":/home/andrew/go/bin:/usr/local/go/bin"))
(setq exec-path (append exec-path '("/home/andrew/go/bin")))
(setq exec-path (append exec-path '("/usr/local/go/bin")))
;;
;;

;; Defines go-mode key bindings
(add-hook 'go-mode-hook
	  (lambda ()
	    ;; (local-set-key (kbd "M-.") 'godef-jump)
	    ;; (local-set-key (kbd "M-,") 'pop-tag-mark)
	    ;; (local-set-key (kbd "C-c C-s") 'godoc-at-point)
	    (local-set-key (kbd "C-c C-p") 'go-play-region)
	    (local-set-key (kbd "C-c C-d") 'go-download-play)
	    ;; ;; Define some eglot-mode keys
	    (define-key eglot-mode-map (kbd "C-c C-¬") 'eglot-reconnect)
	    (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
	    ;; (local-set-key (kbd "C-c C-!") 'godoc)))
	    (define-key eglot-mode-map (kbd "M-n") 'eglot-find-implementation)))

;; Attempt to start eglot automatically when go-mode buffer is visited
(add-hook 'go-mode-hook 'eglot-ensure)

;; ;; rebind completion-at-point function
(global-unset-key (kbd "C-M-i"))
(global-set-key (kbd "C-c C-c") 'completion-at-point)

;; adds company-mode to all buffers
(add-hook 'after-init-hook 'global-company-mode)
