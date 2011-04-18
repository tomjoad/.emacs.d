(fset 'yes-or-no-p 'y-or-n-p)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; loads
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auctex-11.85")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")


(load "private" t) ;; private stuff

(load "auctex")
(load "fullscreen")
(load "kill-wspace-mode")
(load "ruby-electric")
(load "ruby-flymake-mode")
(load "rvm")
(load "yaml-mode")
(load "zenburn")
(load "php-mode")
(load "pomodoro")

;; order is important :-/
(load "js2-mode")
(load "javascript")

;; set color theme
(zenburn)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote ((".*" . "~/.emacs.backups"))))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(global-linum-mode t)
 '(ido-enable-flex-matching t)
 '(ido-max-directory-size 100000)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(js2-auto-indent-p nil)
 '(js2-bounce-indent-p nil)
 '(kill-wspace-mode t)
 '(menu-bar-mode nil)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(twitter-include-replies t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(uniquify-separator ":"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "unknown" :family "Inconsolata"))))
 '(twitter-header-face ((t (:background "gray40"))))
 '(twitter-time-stamp-face ((t (:slant italic))))
 '(twitter-user-name-face ((t (:background "gray40" :weight bold)))))

;; custom stuff
(add-to-list 'auto-mode-alist (cons "\\(Rakefile\\|Gemfile\\)\\'" 'ruby-mode))
(add-to-list 'auto-mode-alist (cons "\\.\\(js\\|as\\|json\\)\\'" 'js2-mode))
(add-to-list 'auto-mode-alist (cons "\\.\\(yml\\|yaml\\)\\'" 'yaml-mode))

(add-hook 'ruby-mode-hook
       (lambda ()
         (ruby-electric-mode)
         (c-toggle-auto-state 0)
         (c-toggle-hungry-state 1)
         (define-key ruby-mode-map [(backspace)] 'c-electric-backspace)
         (define-key ruby-mode-map [(control d)] 'c-electric-delete-forward)))

(add-hook 'js2-mode-hook
          (lambda ()
            (c-toggle-auto-state 0)
            (c-toggle-hungry-state 1)
            (set (make-local-variable 'indent-line-function) 'javascript-indent-line)
            (define-key js2-mode-map [(return)] 'newline-and-indent)
            (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
            (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)))

(put 'set-goal-column 'disabled nil)

(put 'scroll-left 'disabled nil)
