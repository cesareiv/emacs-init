;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Initialization File ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Register the Melpa Emacs Package Repository
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Prevent Emacs from creating backups of files 
(setq backup-inhibited t)

;; Prevent Emacs from auto-saving files
(setq auto-save-default nil)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Make it so all '.js' files auto load 'rjsx-mode'
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Key Bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Function key Bindings

;; F1 -- Go to a specific line number in the current buffer (file)
(global-set-key [f1] 'goto-line)
		
;; F2 -- Comment out a Marked (highlighted) region of text
(global-set-key [f2] 'comment-region)

;; F5 -- Switch to a different buffer (file)
(global-set-key [f5] 'bury-buffer)

;; Ctrl+c key bindings

;; Open the Melpa Emacs Package Screen (Ctrl+c -> i)
(defun func/open-package-installer ()
  (interactive)
  (package-refresh-contents)
  (package-list-packages)
  )
(global-set-key (kbd "C-c i") 'func/open-package-installer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Change Colors of things... ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "color-95")))))
