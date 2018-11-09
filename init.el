
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(setq quelpa-upgrade-p t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck exec-path-from-shell company-ycmd jedi ein slime auctex evil-tutor ox-reveal ox-ioslide makey f s el-get w3m org-evil evil-collection evil-org evil goto-chg quelpa))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/org-impress-js.el")
(require 'ox-reveal)
(setq org-reveal-root "file:///Users/Nidawaqar/reveal.js")
(setq org-use-property-inheritance t)
(exec-path-from-shell-initialize)
(setq evil-want-keybinding nil)
(setq evil-want-integration t)
(company-mode 1)
(require 'ycmd)
(set-variable 'ycmd-server-command '("python3" "/Users/Nidawaqar/ycmd/ycmd/"))
(add-hook 'after-init-hook #'global-ycmd-mode)
(company-mode 1)
(global-flycheck-mode)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(require 'company-ycmd)
(company-ycmd-setup)
(require 'ycmd-eldoc)
(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
(electric-pair-mode 1)
(require 'ein)
(require 'evil)
(evil-collection-init)
(evil-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(eval-after-load 'w3m
  '(progn
     (define-key w3m-mode-map "q" 'w3m-previous-buffer)
     (define-key w3m-mode-map "w" 'w3m-next-buffer)
     (define-key w3m-mode-map "x" 'w3m-close-window)
     (define-key w3m-mode-map "z" 'w3m-delete-buffer)
     (define-key w3m-mode-map "p" 'w3m-copy-buffer)))

 ;; w3m search engine change (using duckduckgo lite)      
 (eval-after-load "w3m"                                   
 '(progn                                                  
 (require 'w3m-search)                                    
 (setq w3m-search-default-engine "duckduckgo")            
 (add-to-list 'w3m-search-engine-alist                    
 '("duckduckgo" "http://www.duckduckgo.com/lite/?q=%s"))))
(global-linum-mode 1)
