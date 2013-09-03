;; General Setup ;;
(set-frame-parameter nil 'font "ProggyCleanSZ-12")  ;; Font
(cua-mode 1)                                        ;; Allow ctl-c/v copy past
(transient-mark-mode 1)                             ;; Highlight text selection
(delete-selection-mode 1)                           ;; Delete seleted text when typing
(global-font-lock-mode 1)                           ;; Turn on syntax coloring
(show-paren-mode 1)                                 ;; Turn on paren match highlighting
(setq show-paren-style 'expression)                 ;; Highlight entire bracket expression
(global-linum-mode 1)                               ;; Display line numbers in margin
(column-number-mode 1)                              ;; Show the cursor's column position
(setq make-backup-files nil)                        ;; Stop creating those backup~ files
(setq auto-save-default nil)                        ;; Stop creating those #autosave# files
(setq-default truncate-lines 1)                     ;; Disable line wrap
(scroll-bar-mode -1)                                ;; Disable scrollbar
(menu-bar-mode -1)                                  ;; Disable menubar
(tool-bar-mode -1)                                  ;; Disable toolbar
(add-to-list 'load-path "~/.emacs.d")               ;; Load the emacs.d folder
(prefer-coding-system 'utf-8)                       ;; Make utf-8 the default encoding
;; End ;;

;; EL-Get Stuff ;;
(load "~/.emacs.d/el-get-conf.el")                  ;; Load secondary file containing el-git conf
;; End

;; Solarized Color Theme ;;
(load-theme 'solarized-dark t)                      ;; Load solarized theme ;;
;; End ;;

;; Rainbow Delimiters ;;
(require 'rainbow-delimiters)                       ;; Load Rainbow Delimiters mode
(global-rainbow-delimiters-mode)                    ;; Make it global for all buffers
;; End ;;

;; Auto Complete ;;
(require 'auto-complete-config)                     ;; Load autocomplete conf
(ac-config-default)                                 ;; Load autocomplete
(add-to-list 'ac-dictionary-directories 
"~/.emacs.d/el-get/auto-complete/dict")             ;; Dictionary Directory for autocomplete
;; End ;;

;; CEDET ;;
(global-ede-mode 1)                                 ;; Enable the Project management system
(semantic-load-enable-code-helpers)                 ;; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)                       ;; Enable template insertion menu
;; End ;;
