(setq visible-bell t)

;; (set-default-coding-systems 'iso-8859-1)
;; (prefer-coding-system 'utf-8)

;;(global-font-lock-mode t)
;; found @  http://forum.hardware.fr/hardwarefr/Programmation/sujet-42345-1.htm

;; mettre en surligné la zone en cours de selection.
;; Souvenez-vous de C-<espace> et tout ça ...
(transient-mark-mode t)

;; parenthese matching, permet de verifier au fur et à mesure
;; de la frappe que l'on ferme bien de que l'on ouvre, aussi
;; bien pour les parenthèses que les crochets ou les accolades.
(show-paren-mode 1)
(setq-default hilight-paren-expression t)
 
;; une jolie couleur de fond
;; (set-background-color "Wheat")
 
 ;; colorisation de la syntaxe ...
(global-font-lock-mode t)
 ;; ...avec le maximum de couleurs
(setq font-lock-maximum-decoration t)  

;; completion sur shift-tab
(global-set-key (quote [S-iso-lefttab]) (quote dabbrev-expand))
(global-set-key (quote [S-tab]) (quote dabbrev-expand)) 

;; circuler entre les vues par ctrl-tab
(global-set-key [(control tab)] `other-window) 

;; on arrete de rajouter des lignes avec bas en fin de buffer
(setq next-line-add-newlines nil) 

;; on est en europe, config du charset par defaut proprement
;;(standard-display-8bit 128 255)
;;(standard-display-european t)

;; affichage de l heure dans la barre d'info (format 24h) :
(display-time)
(setq display-time-24hr-format t)

;; Affiche numero de ligne et colonne dans la barre d'info
(setq column-number-mode t)
(setq line-number-mode t)
 
;; petite fenetre de compil, pas tout l'ecran, merci
(setq compilation-window-height 10) 

;; flex & bison
(add-to-list 'auto-mode-alist '("\.l$" . c-mode)) 
(add-to-list 'auto-mode-alist '("\.y$" . c-mode)) 

;; cg
(add-to-list 'auto-mode-alist '("\.cg$" . c-mode)) 

;; cuda
(add-to-list 'auto-mode-alist '("\.cu$" . c-mode)) 

;; swig
(add-to-list 'auto-mode-alist '("\.i$" . c-mode)) 

;;===================================================================

(set-language-environment "latin-1")

 

;; Raccourcis clavier
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f7] 'search-forward)
(global-set-key [f8] 'repeat)
(global-set-key [(control z)] 'undo)
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(control \\)] 'indent-region)
(global-set-key [f10]  'start-kbd-macro)
(global-set-key [f11]  'end-kbd-macro)
(global-set-key [f12]  'call-last-kbd-macro)
(global-set-key [(meta c)] 'copy-region-as-kill)
(global-set-key [(meta v)] 'yank)

;;(custom-set-faces)

;; C-style
(c-add-style 
 "nich2o-c-style" 
 (quote
  (
   ;; Indentation de base = 2 espaces
   (c-basic-offset . 2) 
   (c-backslash-column . 48) 
   (c-cleanup-list scope-operator) 
   (c-comment-only-line-offset . 0) 
   (c-electric-pound-behavior) 
   (c-hanging-braces-alist 
    (brace-list-open) 
    (brace-entry-open) 
    (substatement-open after) 
    (block-close . c-snug-do-while) 
    (extern-lang-open after) 
    (inexpr-class-open after) 
    (inexpr-class-close before)) 
   (c-hanging-colons-alist) 
   (c-hanging-comment-starter-p . t) 
   (c-hanging-comment-ender-p . t) 
   (c-offsets-alist 
    (string . c-lineup-dont-change) 
    (c . c-lineup-C-comments) 
    (defun-open . 0) 
    (defun-close . 0) 
    (defun-block-intro . +) 
    (class-open . 0) 
    (class-close . 0) 
    (inline-open . +) 
    (inline-close . 0) 
    (func-decl-cont . +) 
    (knr-argdecl-intro . +) 
    (knr-argdecl . 0) 
    (topmost-intro . 0) 
    (topmost-intro-cont . 0) 
    (member-init-intro . +) 
    (member-init-cont . 0) 
    (inher-intro . +) 
    (inher-cont . c-lineup-multi-inher) 
    (block-open . 0) 
    (block-close . 0)
    (brace-list-open . 0)
    (brace-list-close . 0)
    (brace-list-intro . +)
    (brace-list-entry . 0)
    (brace-entry-open . 0)
    (statement . 0)
    (statement-cont . +)
    (statement-block-intro . +)
    (statement-case-intro . +)
    (statement-case-open . 0)
    (substatement . +)

    ;; Pas de décalage lors de l'ouverture d'un bloc
    (substatement-open . 0)
    (case-label . 0)
    (access-label . -)
    (label . 2)
    (do-while-closure . 0)
    (else-clause . 0)
    (catch-clause . 0)
    (comment-intro . c-lineup-comment)
    (arglist-intro . +)
    (arglist-cont . 0)
    (arglist-cont-nonempty . c-lineup-arglist)
    (arglist-close . +)
    (stream-op . c-lineup-streamop)
    (inclass . +)
    (cpp-macro . -1000)
    (cpp-macro-cont . c-lineup-dont-change)
    (friend . 0)
    (objc-method-intro . -1000)
    (objc-method-args-cont . c-lineup-ObjC-method-args)
    (objc-method-call-cont . c-lineup-ObjC-method-call)
    (extern-lang-open . 0)
    (extern-lang-close . 0)
    (inextern-lang . +)
    (namespace-open . 0)
    (namespace-close . 0)
    (innamespace . +)
    (template-args-cont . +)
    (inlambda . c-lineup-inexpr-block)
    (lambda-intro-cont . +)
    (inexpr-statement . 0)
    (inexpr-class . +)
    )
   )
  )
 )

;; Saving emacs session
(desktop-load-default)
(desktop-read)

;; Python
;;(autoload 'python-mode "python-mode" "Python editing mode." t)
;;(add-to-list 'auto-mode-alist '(".py$" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;; python mode
(autoload 'python-mode "python-mode" "Python editing mode" t)
(setq auto-mode-alist (cons '(".py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))

;;(setq locale-preferred-coding-systems
;;       (cons (cons ".*\\.utf-8" 'utf-8) locale-preferred-coding-systems))
;; ((lambda (cs)
;;    (set-keyboard-coding-system cs)
;;    (if cs (set-terminal-coding-system cs)))
;;  (set-locale-environment nil))

;;(setq locale-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)

(set-language-environment 'UTF-8)

;;(setq selection-coding-system 'compound-text-with-extensions)

;;; Ben modif
;;; Code:
(defgroup hide-region nil
  "Functions to hide region using an overlay with the invisible
property. The text is not affected."
  :prefix "hide-region-"
  :group 'convenience)
 
(defcustom hide-region-before-string "@["
  "String to mark the beginning of an invisible region. This string is
not really placed in the text, it is just shown in the overlay"
  :type '(string)
  :group 'hide-region)
 
(defcustom hide-region-after-string "]@"
  "String to mark the beginning of an invisible region. This string is
not really placed in the text, it is just shown in the overlay"
  :type '(string)
  :group 'hide-region)
 
(defcustom hide-region-propertize-markers t
  "If non-nil, add text properties to the region markers."
  :type 'boolean
  :group 'hide-region)
 
(defvar hide-region-overlays nil
  "Variable to store the regions we put an overlay on.")
 
(defun hide-region-hide ()
  "Hides a region by making an invisible overlay over it and save the
overlay on the hide-region-overlays \"ring\""
  (interactive)
  (let ((new-overlay (make-overlay (mark) (point))))
    (setq hide-region-overlays
	  (append
	   (list new-overlay) hide-region-overlays))
    (overlay-put new-overlay 'invisible t)
    (overlay-put new-overlay 'intangible t)
    (overlay-put new-overlay 'before-string
                 (if hide-region-propertize-markers
                     (propertize hide-region-before-string
                                 'font-lock-face 'region)
                   hide-region-before-string))
    (overlay-put new-overlay 'after-string
                 (if hide-region-propertize-markers
                     (propertize hide-region-after-string
                                 'font-lock-face 'region)
                   hide-region-after-string))))
 
(defun hide-region-unhide ()
  "Unhide a region at a time, starting with the last one hidden and
deleting the overlay from the hide-region-overlays \"ring\"."
  (interactive)
  (if (car hide-region-overlays)
      (progn
	(delete-overlay (car hide-region-overlays))
	(setq hide-region-overlays (cdr hide-region-overlays)))))
 
(provide 'hide-region)
 
;;; hide-region.el ends here
 
(global-set-key [(meta j)] 'hide-region-hide)
(global-set-key [(meta f)] 'hide-region-unhide)


;; The *scratch* buffer is now persistent across sessions.
;; (To switch this off, customize the `aquamacs-scratch-file' variable to nil.) 
;;mauvais idee:(setq aquamacs-scratch-file nil) 

;;  - Sets the command (Apple) key as Meta
;;(setq mac-command-modifier 'meta)
;;- Sets the option key as Meta (this is default)
(setq mac-option-modifier 'meta) 

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "~/.emacs_autosaves_" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


;; from clement ;;;;;;;;;

;; inhibit startup
(setq inhibit-startup-message t)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; C-k kills whole line and newline if at beginning of line
(setq kill-whole-line t)

;; spaces instead of tabs by default
(setq-default indent-tabs-mode nil)

;; No Tool bar
;;(tool-bar-mode nil)

;; Date
(defun now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%B %e, %Y, %-I:%M%p")))
(global-set-key (kbd "C-c i") 'now)

;; ;; Global settings
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(load-home-init-file t t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))


;; Set color theme
;; (require 'color-theme)
;; (defun color-theme-almost-monokai ()
;;   (interactive)
;;   (color-theme-install
;;    '(color-theme-almost-monokai
;;      ((background-color . "#272821")
;;       (foreground-color . "#F8F8F2")
;;       (cursor-color . "#DAD085"))
;;      (default ((t (nil))))
;;      (modeline ((t (:background "white" :foreground "black" :box 
;;                                 (:line-width 1 :style released-button)))))
;;      (font-lock-builtin-face ((t (:foreground "#A6E22A"))))
;;      (font-lock-comment-face ((t (:italic t :foreground "#75715D"))))
;;      (font-lock-constant-face ((t (:foreground "#A6E22A"))))
;;      (font-lock-doc-string-face ((t (:foreground "#65B042"))))
;;      (font-lock-string-face ((t (:foreground "#DFD874"))))
;;      (font-lock-function-name-face ((t (:foreground "#F1266F" :italic t))))
;;      (font-lock-keyword-face ((t (:foreground "#66D9EF"))))
;;      (font-lock-type-face ((t (:underline t :foreground "#89BDFF"))))
;;      (font-lock-variable-name-face ((t (:foreground "#A6E22A"))))
;;      (font-lock-warning-face ((t (:bold t :foreground "#FD5FF1"))))
;;      (highlight-80+ ((t (:background "#D62E00"))))
;;      (hl-line ((t (:background "#1A1A1A"))))
;;      (region ((t (:background "#6DC5F1"))))
;;      (ido-subdir ((t (:foreground "#F1266F"))))
;;     )
;;   )
;; )
;; (provide 'color-theme-almost-monokai)
;; (color-theme-almost-monokai)

;; Frame behavior
;; (setq initial-frame-alist 
;;       '((color-theme-almost-monokai)
;;         (top . 22) (left . 0) (width . 203) (height . 35)))
;; (setq default-frame-alist 
;;       '((background-Color . "#272821")
;;         (foreground-color . "#F8F8F2")
;;         (cursor-color . "#DAD085")
;;         (top . 22) (left . 0) (width . 203) (height . 53)))

;; Break lines
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Buffer menu same menu!
(global-set-key (kbd "C-x C-b") 'buffer-menu) 


(setq load-path (cons "~/.emacs.d/vendor/" load-path))

;;lua mode 
(load "lua-mode.el")
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;; code starts
(require 'lua-mode)

; for hs-minor-mode
(defvar lua-sexp-alist '(("then" . "end")
                        ("function" . "end")
                        ("do" . "end")))
(defun lua-forward-sexp (&optional arg)
 "Forward to block end"
 (save-match-data
 (let ((stackheight 0)
       (regexp ""))
   (setq regexp (concat "\\(" (mapconcat 'car lua-sexp-alist "\\|")
"\\|end\\)"))
   (re-search-forward regexp nil t arg)
   (setq stackheight 1)
   (while (> stackheight 0)
     (re-search-forward regexp nil t arg)
     (if (string= "end" (match-string 1))
         (setq stackheight (- stackheight 1))
       (setq stackheight (+ stackheight 1)))))))

(add-to-list 'hs-special-modes-alist
            `(lua-mode ,(concat "\\(?:" (mapconcat 'car
lua-sexp-alist "\\|") "\\)")
            ,(concat "\\(?:" (mapconcat 'cdr lua-sexp-alist "\\|") "\\)")
            "--"                     ; comment prefix
            lua-forward-sexp))

(defun my-lua-hook()
 (interactive)
 (hs-minor-mode 1)
 ; key bindings
 (local-set-key [?\C-,] 'hs-hide-block)
 (local-set-key [?\C-.] 'hs-show-block)
)
(add-hook 'lua-mode-hook 'my-lua-hook)
(add-hook 'lua-mode-hook
          (lambda () 
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'c-mode-hook 
          (lambda () 
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;; xflow mode
;;(load "xflow-mode.el")

;; keyboard macro
(global-set-key [(control 1)]  'start-kbd-macro)
(global-set-key [(control 2)]  'end-kbd-macro)
(global-set-key [(control 3)]  'call-last-kbd-macro)


;; display lines number
;;(require 'linum)
;;(global-linum-mode 1)
;;(setq linum-format "%d: ")

(global-set-key "\C-a" 'beginning-of-line)
