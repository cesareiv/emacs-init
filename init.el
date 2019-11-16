;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Initialization File ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ============================
;; Basic Customization
;; ============================

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Register the Melpa Emacs Package Repository
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Prevent Emacs from creating backups of files 
(setq backup-inhibited t)

;; Smooth scroll
(setq
 hscroll-step 1
 scroll-conservatively 1000)

;; Prevent Emacs from auto-saving files
(setq auto-save-default nil)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Make it so all '.js' files auto load 'js2-mode'
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Disable tab characters in indentation
(setq-default indent-tabs-mode nil)

;; Use 2 spaces when tabbing HTML elements
(setq-default sgml-basic-offset 2)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Disable the *Messages* Buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Disable the *Completions* buffer
(add-hook 'minibuffer-exit-hook 
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))


;; Remove tabs
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

;; Indent a region
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

;; Show line numbers when goto-line
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show paren mode
(show-paren-mode 1)

;; Set color or paren cursor to not uglee
(require 'paren)
;;(set-face-background 'show-paren-match (face-background 'default))
;;(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Key Bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Function key Bindings

;; [F1] -- Go to a specific line number in the current buffer (file)
(global-set-key [f1] 'goto-line)
		
;; [F2] -- Comment out a Marked (highlighted) region of text
(global-set-key [f2] 'comment-region)

;; [F3] -- Comment out a Marked (highlighted) region of text
(global-set-key [f3] 'uncomment-region)

;; [F4] -- Cleanup all trailing whitespace
(global-set-key [f4] 'whitespace-cleanup)

;; [F5] -- Switch to a different buffer (file)
(global-set-key [f5] 'bury-buffer)

;; Ctrl+c key bindings

;; [Ctrl+c -> i] -- Open the Melpa Emacs Package Screen
(defun func/open-package-installer ()
  (interactive)
  (package-refresh-contents)
  (package-list-packages)
  )
(global-set-key (kbd "C-c i") 'func/open-package-installer)

;; [Ctrl+c -> TAB] -- Mark the entire file
;; Hint: Useful for auto-formatting the entire file by pressing (Ctrl+c -> TAB -> TAB)
(global-set-key (kbd "C-c TAB") 'mark-whole-buffer)

;; Install custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load Custom Files inside ~/.emacs.d/custom-lisp ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-directory (dir)
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))
                 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/custom-lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5c9bd73de767fa0d0ea71ee2f3ca6fe77261d931c3d4f7cca0734e2a3282f439" "8de599adee6766e541af4aa5f01ffc9cfbcbf94adc60a80ccb6caccb3fbceaa1" default)))
 '(package-selected-packages
   (quote
    (markdown-preview-mode markdown-mode web-mode rjsx-mode jsx-mode docker-compose-mode dockerfile-mode yaml-mode vue-mode json-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "color-237")))))
