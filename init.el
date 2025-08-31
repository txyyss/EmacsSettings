;;; package --- Summary -*- lexical-binding: t;-*-

;;; Commentary:
;; My Init Settings for Emacs
;; C-c @ C-q 展示大纲模式，隐藏其它
;; C-c @ C-s 显示子节点

;;; Code:

(setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/sbin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/homebrew/bin" "/opt/homebrew/sbin")))
(setenv "LC_ALL" "en_US.UTF-8")

;;; 设置语言
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(dolist (charset '(kana han cjk-misc bopomofo chinese-gbk gb18030))
  (set-fontset-font t charset (font-spec :name "LXGW WenKai")))
(set-fontset-font t 'greek (font-spec :name "Iosevka"))
(set-fontset-font t 'cyrillic (font-spec :name "Iosevka"))
;; Iosevka Version = 33.2.8
;; Download from https://github.com/be5invis/Iosevka/releases

;;; Startup Message
(defun display-startup-echo-area-message ()
  "Override the default one with my name and welcome."
  (message "Welcome back, Shengyi!"))

(defun restart ()
  "Toggle full screen and then restart Emacs."
  (interactive)
  (when (y-or-n-p "Restart Emacs?")
    (let ((confirm-kill-emacs nil))
      (delete-other-frames)
      (toggle-frame-fullscreen)
      (restart-emacs))))

(defun dired-show-only (regexp)
  "In Dired, show only files whose names match REGEXP.
Other lines are removed from the listing (buffer-only; files are untouched).
Use `revert-buffer' (\\[revert-buffer]) to restore the original listing."
  (interactive "sFiles to show (regexp): ")
  (dired-mark-files-regexp regexp)
  (dired-toggle-marks)
  (dired-do-kill-lines)
  (message "Dired: showing only files matching %s" regexp))

;;; 常用设置
(setq ns-use-thin-smoothing t)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq default-directory "~/")
(setq completion-ignore-case t)
(with-eval-after-load 'dired
  (require 'ls-lisp)
  (require 'dired-x)
  (keymap-set dired-mode-map "% s" #'dired-show-only))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ))
(with-eval-after-load 'which-key
  ;; Show a friendly name for "% s".
  (which-key-add-keymap-based-replacements dired-mode-map "% s" "show only (regexp)"))
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-ts-mode-common-hook 'hs-minor-mode)
(keymap-global-set "<f13>" 'toggle-frame-fullscreen)
(keymap-global-set "<f14>" 'restart)
(keymap-global-set "C-," 'embark-act)
(keymap-global-set "C-;" 'embark-dwim)
(keymap-global-set "C-h B" 'embark-bindings)
(keymap-global-set "C-x /" 'webjump)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "C-x M-r" 'consult-recent-file)
(keymap-global-set "C-x b" 'consult-buffer)
(keymap-global-set "C-x t b" 'consult-buffer-other-tab)
(keymap-global-set "C-x t k" 'tab-bar-close-tab-by-name)
(keymap-global-set "M-[" 'tab-bar-switch-to-prev-tab)
(keymap-global-set "M-]" 'tab-bar-switch-to-next-tab)
(keymap-global-set "M-o" 'occur)
(keymap-global-set "s-," 'customize-group)
(keymap-global-set "s-/" 'dabbrev-completion)
(keymap-global-set "s-;" 'avy-goto-char-timer)
(keymap-global-set "s-<return>" 'magit-status)
(keymap-global-set "s-<tab>" 'tab-switch)
(keymap-global-set "s-[" 'tab-bar-switch-to-prev-tab)
(keymap-global-set "s-/" 'consult-line)
(keymap-global-set "s-]" 'tab-bar-switch-to-next-tab)
(keymap-global-set "s-b" 'consult-buffer-other-tab)
(keymap-global-set "s-d" 'osx-dictionary-search-input)
(keymap-global-set "s-f" 'consult-fd)
(keymap-global-set "s-g" 'consult-goto-line)
(keymap-global-set "s-i" 'ispell-word)
(keymap-global-set "s-l" 'consult-goto-line)
(keymap-global-set "s-m" 'delete-other-windows)
(keymap-global-set "s-o" 'other-window)
(keymap-global-set "s-p" 'osx-dictionary-search-word-at-point)
(keymap-global-set "s-r" 'consult-ripgrep)
(keymap-global-set "s-t" 'tab-bar-new-tab)
(keymap-global-set "s-w" 'tab-bar-close-tab)
(keymap-global-set "s-z" 'delete-window)
(keymap-global-unset "M-<down-mouse-1>")
(keymap-global-unset "M-<drag-mouse-1>")
(keymap-global-unset "M-<mouse-1>")
(keymap-global-unset "M-<mouse-2>")
(keymap-global-unset "M-<mouse-3>")
(keymap-set minibuffer-local-map "C-l" 'embark-export)
(keymap-set emacs-lisp-mode-map "C-c C-n" 'emacs-lisp-native-compile)
(defalias 'elisp-repl 'ielm)
(with-eval-after-load 'paredit
  (keymap-unset paredit-mode-map "C-j")
  (keymap-unset paredit-mode-map "RET"))
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(toggle-frame-fullscreen)
(add-hook 'before-save-hook
          (lambda ()
            (when (and (not (string-match ".*makefile.*" (message "%s" major-mode)))
                       (or (derived-mode-p 'prog-mode)
                           (eq major-mode 'coq-mode)
                           (eq major-mode 'org-mode)))
              (delete-trailing-whitespace))))
;;; Spell checking
;; (setq ispell-list-command "list")

;; Trick: Use M-j to confirm without the matching existed.

;;; eglot for C/C++
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode c++-ts-mode c-ts-mode) "clangd")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)

;;; Useful Definitions
(defconst exclude-file-list '("\\`/[^/|:]+:" ".+\\.v"))

(defun my-icomplete-styles ()
  "Customize my icomplete styles."
  (setq-local completion-styles '(basic partial-completion flex)))

;;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list
   '("/opt/homebrew/share/info"
     "/usr/local/texlive/2024/texmf-dist/doc/info"))
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff"
    "#eeeeec"])
 '(auto-save-visited-interval 3)
 '(auto-save-visited-mode t)
 '(avy-background t)
 '(avy-dispatch-alist
   '((120 . avy-action-kill-move) (88 . avy-action-kill-stay)
     (116 . avy-action-teleport) (109 . avy-action-mark)
     (119 . avy-action-copy) (121 . avy-action-yank)
     (89 . avy-action-yank-line) (105 . avy-action-ispell)
     (122 . avy-action-zap-to-char)))
 '(avy-orders-alist '((avy-goto-char-timer . avy-order-closest)))
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(comint-process-echoes t)
 '(company-backends '(company-math-symbols-unicode))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2)
 '(completion-category-overrides '((file (styles basic partial-completion))))
 '(completion-cycle-threshold 3)
 '(completion-pcm-leading-wildcard t)
 '(completion-styles '(orderless basic))
 '(confirm-kill-emacs 'y-or-n-p)
 '(confirm-kill-processes nil)
 '(consult-preview-excluded-files exclude-file-list)
 '(custom-enabled-themes '(modus-vivendi))
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(dired-dwim-target 'dired-dwim-target-next)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(emacs-lisp-mode-hook '(enable-paredit-mode outline-minor-mode))
 '(embark-help-key "?")
 '(embark-indicators
   '(embark--vertico-indicator embark-minimal-indicator
                               embark-highlight-indicator
                               embark-isearch-highlight-indicator))
 '(engine-mode t)
 '(find-ls-option '("-exec ls -ldh {} +" . "-ldh"))
 '(gap-executable "/usr/local/bin/gap")
 '(gap-start-options '("-f" "-b" "-m" "2m" "-E"))
 '(geiser-chez-binary "chez")
 '(global-auto-revert-mode t)
 '(global-corfu-mode t)
 '(global-corfu-modes '((not lisp-mode) t))
 '(global-hl-line-mode t)
 '(global-org-modern-mode t)
 '(grep-command "rg -nS --no-heading ")
 '(icomplete-minibuffer-setup-hook '(my-icomplete-styles))
 '(ielm-mode-hook '(eldoc-mode))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ispell-extra-args '("-a"))
 '(ispell-local-dictionary "en_US")
 '(ispell-program-name "aspell")
 '(latex-run-command "xelatex -shell-escape")
 '(lisp-interaction-mode-hook '(enable-paredit-mode))
 '(lisp-mode-hook
   '(common-lisp-lisp-mode-hook slime-lisp-mode-hook enable-paredit-mode))
 '(ls-lisp-dirs-first t)
 '(ls-lisp-use-insert-directory-program nil)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-modeline-code-action-fallback-icon "✦")
 '(lsp-pyright-langserver-command "basedpyright")
 '(major-mode-remap-alist
   '((c-mode . c-ts-mode) (c++-mode . c++-ts-mode)
     (html-mode . html-ts-mode)))
 '(marginalia-mode t)
 '(mode-line-format
   '("%e" mode-line-front-space
     (:eval
      (cond
       (buffer-read-only (propertize " ■ " 'face '(:weight "bold")))
       ((and buffer-file-name (buffer-modified-p))
        (propertize " ● " 'face '(:foreground "red" :weight "bold")))))
     (:propertize " %b " face mode-line-buffer-id) " %l:%c "
     (project-mode-line project-mode-line-format) (vc-mode vc-mode)
     mode-line-format-right-align
     (:eval (propertize mode-name 'face 'mode-line)) " "
     mode-line-misc-info mode-line-end-spaces))
 '(mode-line-right-align-edge 'right-margin)
 '(modus-themes-bold-constructs t)
 '(modus-themes-common-palette-overrides
   '((bg-mode-line-active bg-cyan-intense)
     (bg-mode-line-inactive bg-cyan-subtle)
     (border-mode-line-active unspecified)
     (border-mode-line-inactive unspecified) (bg-tab-bar bg-main)
     (bg-tab-current bg-cyan-intense) (bg-tab-other bg-cyan-subtle)
     (fringe unspecified) (bg-hl-line bg-cyan-nuanced)))
 '(modus-themes-italic-constructs t)
 '(modus-themes-prompts '(extrabold))
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(ns-alternate-modifier 'super)
 '(ns-command-modifier 'meta)
 '(orderless-matching-styles '(orderless-regexp orderless-literal orderless-prefixes))
 '(org-appear-autoentities t)
 '(org-appear-autosubmarkers t)
 '(org-babel-load-languages '((emacs-lisp . t) (lisp . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-hide-emphasis-markers t)
 '(org-modern-star 'replace)
 '(org-modules
   '(ol-bibtex ol-docview ol-doi ol-eww ol-info org-mouse org-tempo
               ol-w3m))
 '(org-pretty-entities t)
 '(org-support-shift-select t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(async-status avy company-coq consult corfu embark embark-consult
                  envrc gap-mode geiser-chez geiser-guile
                  geiser-racket haskell-mode lean4-mode ligature
                  lsp-pyright lsp-ui magit marginalia opam-switch-mode
                  orderless org-appear org-modern osx-dictionary
                  paredit pdf-tools proof-general slime tuareg vertico
                  yaml-mode))
 '(package-vc-selected-packages
   '((lean4-mode :url
                 "https://github.com/leanprover-community/lean4-mode.git")))
 '(pdf-view-use-imagemagick t)
 '(pdf-view-use-unicode-ligther nil)
 '(pixel-scroll-precision-mode t)
 '(quit-window-kill-buffer t)
 '(read-buffer-completion-ignore-case t)
 '(recentf-exclude '(".+\\.el\\.gz" "~/\\.emacs\\.d/bookmarks"))
 '(recentf-mode t)
 '(scheme-mode-hook '(geiser-mode--maybe-activate enable-paredit-mode) t)
 '(scroll-bar-mode nil)
 '(switch-to-buffer-obey-display-actions t)
 '(tab-always-indent 'complete)
 '(tab-bar-auto-width-max '(423 40))
 '(tab-bar-close-button-show nil)
 '(tab-bar-format '(tab-bar-format-tabs))
 '(tab-bar-mode t)
 '(tab-bar-new-button-show nil)
 '(tab-bar-new-tab-choice "*scratch*")
 '(tab-bar-new-tab-to 'rightmost)
 '(tab-bar-select-tab-modifiers '(control super))
 '(tab-bar-show 1)
 '(tab-bar-tab-hints nil)
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp))
 '(treesit-font-lock-level 4)
 '(user-full-name "Shengyi Wang")
 '(utop-command "opam exec -- utop -emacs")
 '(vc-follow-symlinks t)
 '(version-control t)
 '(vertico-count 15)
 '(vertico-cycle t)
 '(vertico-mode t)
 '(vertico-resize t)
 '(visible-bell t)
 '(warning-suppress-log-types '((emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs)))
 '(webjump-sites
   '(("Wikipedia"
      . [simple-query "wikipedia.org" "wikipedia.org/wiki/" ""])
     ("Google"
      . [simple-query "www.google.com"
                      "https://www.google.com/search?ie=utf-8&oe=utf-8&q="
                      ""])))
 '(which-key-mode t)
 '(windmove-default-keybindings '(nil super))
 '(windmove-delete-default-keybindings '(nil control super))
 '(windmove-mode t)
 '(windmove-wrap-around t)
 '(yas-global-mode t))

;;; Close tab after kill buffer
(defun close-tab-after-kill-buffer ()
  "Close tab after kill buffer, if it is not the only one tab."
  (let ((last-tab-p (= 1 (length (funcall tab-bar-tabs-function))))
        (multiple-windows-p
         (< 1 (length (delete-dups (mapcar #'window-buffer (window-list)))))))
    (unless (or last-tab-p multiple-windows-p)
      (let ((tab-index (tab-bar--tab-index-by-name (buffer-name))))
        (when tab-index
          (tab-bar-close-tab (1+ tab-index)))))))
(add-hook 'kill-buffer-hook #'close-tab-after-kill-buffer)

;;; Org Mode
(add-hook 'org-mode-hook 'org-appear-mode)

;;; Coq Settings
(defun allow-consult-preview ()
  "Allow consult preview when at least one .v file is opened."
  (when (and (boundp 'consult-preview-excluded-files)
             (member ".+\\.v" consult-preview-excluded-files))
    (delete ".+\\.v" consult-preview-excluded-files)))

(defun set-current-switch ()
  "Set current opam switch for Coq."
  (require 'tuareg)
  (opam-switch-set-switch (tuareg-opam-current-compiler)))

(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook #'opam-switch-mode)
(add-hook 'coq-mode-hook #'allow-consult-preview)
(add-hook 'coq-mode-hook #'set-current-switch)

(setq coq-highlight-hyps-cited-in-response nil)

;;; Lisp

(setq inferior-lisp-program "sbcl")

;;; Vertico
(keymap-set vertico-map "s-;" #'vertico-quick-exit)
(keymap-set vertico-map "DEL" #'vertico-directory-delete-char)
(keymap-set vertico-map "M-DEL" #'vertico-directory-delete-word)
(keymap-set vertico-map "RET" #'vertico-directory-enter)
(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)

;;; Embark
(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)

;;; 设置sokoban
;; (autoload 'sokoban "sokoban.el"
;;   "Start a new game of Sokoban." t)
;; (autoload 'sokoban-mode "sokoban.el"
;;   "Play Sokoban in current buffer." t)
;; (setq sokoban-levels-dir "c:/Useful/Open/emacs/site-lisp/sokoban-levels")

;;; 杂项
(defun zh-count-word ()
  "Count Chinese words."
  (interactive)
  (let ((beg (point-min)) (end (point-max))
        (eng 0) (non-eng 0))
    (if mark-active
        (setq beg (region-beginning)
              end (region-end)))
    (save-excursion
      (goto-char beg)
      (while (< (point) end)
        (cond ((not (equal (car (syntax-after (point))) 2))
               (forward-char))
              ((< (char-after) 128)
               (progn
                 (setq eng (1+ eng))
                 (forward-word)))
              (t
               (setq non-eng (1+ non-eng))
               (forward-char)))))
    (message "English words: %d\nNon-English characters: %d"
             eng non-eng)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 180 :family "Iosevka"))))
 '(fixed-pitch ((t (:family "Iosevka"))))
 '(fixed-pitch-serif ((t (:family "Iosevka Slab"))))
 '(org-modern-symbol ((t (:family "Iosevka"))) t)
 '(variable-pitch ((t (:family "Iosevka Aile")))))

(defun f2c (fahrenheit)
  "Convert degrees Fahrenheit (FAHRENHEIT) to degrees Celsius."
  (interactive "nFahrenheit (°F): ")
  (message "%s °C" (/ (* 5 (- fahrenheit 32)) 9.0)))

(defun c2f (celsius)
  "Convert degrees Celsius (CELSIUS) to degrees Fahrenheit."
  (interactive "nCelsius (°C): ")
  (message "%s °F" (+ (/ (* celsius 9.0) 5.0) 32)))

(defvar ligatures-iosevka
  '("-<<" "-<" "-<-" "<--" "<---" "<<-" "<-" "->" "->>" "--->" "-->" "->-" ">-" ">>-"
    "=<<" "=<" "=<=" "<==" "<===" "<<=" "<=" "=>" "=>>" "===>" "==>" "=>=" ">=" ">>="
    "<->" "<-->" "<--->" "<---->" "<=>" "<==>" "<===>" "<====>" "::" ":::" "__"
    "<~~" "</" "</>" "/>" "~~>" "==" "!=" "<>" "===" "!==" "!==="
    "<:" ":=" "*=" "*+" "<*" "<*>" "*>" "<|" "<|>" "|>" "<." "<.>" ".>" "+*" "=*" "=:" ":>"
    "(*" "*)" "/*" "*/" "[|" "|]" "{|" "|}" "++" "+++" "\\/" "/\\" "|-" "-|" "<!--" "<!---"))

(use-package ligature
  :config
  (ligature-set-ligatures 'emacs-lisp-mode ligatures-iosevka)
  (ligature-set-ligatures 'coq-mode ligatures-iosevka)
  (ligature-set-ligatures 'lean4-mode ligatures-iosevka))

(pdf-tools-install)

;; Closure capturing private state so we only expose one public function.
(let ((encode-table nil)   ;; ASCII -> Fraktur (built on first use)
      (decode-table nil)   ;; Fraktur -> ASCII (built on first use)
      (fraktur-set  nil))  ;; membership set for detection
  (defun toggle-fraktur (beg end)
    "Toggle ASCII <-> Fraktur for region or prompted input.

If a region is active, detect its content: if it contains any Fraktur
letters, decode them back to ASCII; otherwise encode ASCII letters to
Fraktur. Without a region, prompt for a string, apply the same rule,
insert the result at point, and copy it to the kill-ring.

Note: Correct rendering depends on your font's support for these
Unicode code points."
    (interactive
     (if (use-region-p)
         (list (region-beginning) (region-end))
       (list nil nil)))
    ;; Initialize tables and membership set once.
    (unless encode-table
      (let ((lower-src "abcdefghijklmnopqrstuvwxyz")
            (lower-dst "𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟")
            (upper-src "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            (upper-dst "𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅"))
        (setq encode-table (make-char-table 'translation-table nil)
              decode-table (make-char-table 'translation-table nil)
              fraktur-set  (make-char-table 'binary nil))
        ;; Lowercase map + membership
        (dotimes (i (length lower-src))
          (let ((a (aref lower-src i)) (f (aref lower-dst i)))
            (aset encode-table a f)
            (aset decode-table f a)
            (aset fraktur-set  f t)))
        ;; Uppercase map + membership
        (dotimes (i (length upper-src))
          (let ((a (aref upper-src i)) (f (aref upper-dst i)))
            (aset encode-table a f)
            (aset decode-table f a)
            (aset fraktur-set  f t)))))
    ;; Local helper: does S contain any Fraktur chars?
    (let ((has-fraktur?
           (lambda (s)
             (catch 'found
               (mapc (lambda (ch)
                       (when (aref fraktur-set ch)
                         (throw 'found t)))
                     (string-to-list s))
               nil))))
      (if (and beg end)
          ;; Region case
          (let* ((s (buffer-substring-no-properties beg end))
                 (decode? (funcall has-fraktur? s)))
            (translate-region beg end (if decode? decode-table encode-table))
            (message (if decode? "Decoded region from Fraktur to ASCII." "Encoded region from ASCII to Fraktur.")))
        ;; Prompted input case
        (let* ((s (read-string "Text to toggle (ASCII/Fraktur): "))
               (decode? (funcall has-fraktur? s))
               (tbl (if decode? decode-table encode-table))
               (out (apply #'string
                           (mapcar (lambda (ch) (or (aref tbl ch) ch))
                                   (string-to-list s)))))
          (kill-new out)
          (insert out)
          (message (if decode? "Decoded and yanked." "Encoded and yanked.")))))))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp-deferred)))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda () (require 'lsp-pyright))))

(add-hook 'after-init-hook 'envrc-global-mode)

(provide 'init)

;;; init.el ends here
