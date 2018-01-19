(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("" . "~/.emacs.d/bak"))))
 '(custom-safe-themes
   (quote
    ("f5b591870422cd28da334552aae915cdcae3edfcfedb6653a9f42ed84bbec69f" default)))
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-visual-line-mode t)
 '(hscroll-step 1)
 '(indicate-empty-lines t)
 '(insert-default-directory nil)
 '(isearch-allow-scroll t)
 '(scroll-step 1)
 '(set-mark-command-repeat-pop t)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; For the theme
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stale" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(load-theme 'monokai t)
;; Org-mode settings
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (C . t)
   ))
