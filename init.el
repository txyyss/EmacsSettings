;;; package --- Summary -*- lexical-binding: t;-*-
;;; Commentary:


;; 快捷键提醒
;; C-c @ C-q 展示大纲模式，隐藏其它
;; C-c @ C-s 显示子节点

;;; 设置环境变量
;; (setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/sbin:~/.local/bin:/usr/local/bin:/Library/TeX/texbin:/Applications/Racket v8.14/bin:" (getenv "PATH")))
;; (setq exec-path (append exec-path '("/opt/homebrew/bin" "/opt/homebrew/sbin" "~/.local/bin" "/usr/local/bin" "/Library/TeX/texbin" "/Applications/Racket v8.14/bin")))
(setenv "LC_ALL" "en_US.UTF-8")

;;; 设置语言
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(dolist (charset '(kana han cjk-misc bopomofo chinese-gbk gb18030))
  (set-fontset-font t charset (font-spec :name "Source Han Sans SC")))
(set-fontset-font t 'greek (font-spec :name "Iosevka"))
;; Iosevka Version = 32.2.0
;; Download from https://github.com/be5invis/Iosevka/releases

;;; 常用设置
(setq default-directory "~/")
(setq completion-ignore-case t)
(with-eval-after-load 'dired (require 'dired-x))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ))
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-ts-mode-common-hook 'hs-minor-mode)
(keymap-global-set "<f13>" 'toggle-frame-fullscreen)
(keymap-global-set "C-," 'embark-act)
(keymap-global-set "C-;" 'embark-dwim)
(keymap-global-set "C-h B" 'embark-bindings)
(keymap-global-set "C-x /" 'webjump)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "C-x M-r" 'consult-recent-file)
(keymap-global-set "C-x b" 'consult-buffer)
(keymap-global-set "C-x t b" 'consult-buffer-other-tab)
(keymap-global-set "M-g M-g" 'consult-goto-line)
(keymap-global-set "M-g g" 'consult-goto-line)
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "s-$" 'ispell-word)
(keymap-global-set "s-/" 'dabbrev-expand)
(keymap-global-set "s-<return>" 'magit-status)
(keymap-global-set "s-f" 'consult-fd)
(keymap-global-set "s-g" 'consult-goto-line)
(keymap-global-set "s-l" 'consult-line)
(keymap-global-set "s-m" 'delete-other-windows)
(keymap-global-set "s-o" 'occur)
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
(defalias 'elisp-repl 'ielm)
(eval-after-load 'paredit
  #'(define-key paredit-mode-map (kbd "C-j") nil))
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(toggle-frame-fullscreen)
(recentf-mode t)
(add-hook 'before-save-hook
          (lambda ()
            (when (and (not (string-match ".*makefile.*" (message "%s" major-mode)))
                       (or (derived-mode-p 'prog-mode)
                           (eq major-mode 'coq-mode)))
              (delete-trailing-whitespace))))
;;; Spell checking
;; (setq ispell-list-command "list")

(which-key-mode)

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)

;; Trick: Use M-j to confirm without the matching existed.
(defun my-icomplete-styles ()
  "Customize my icomplete styles."
  (setq-local completion-styles '(basic partial-completion flex)))

;;; Org Mode 设置
(define-key global-map [?\C-c ?a] 'org-agenda)
(define-key global-map [?\C-c ?r] 'org-remember)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'org-variable-pitch-minor-mode)

;;; LSP for LaTeX
(with-eval-after-load 'tex-mode
  (add-hook 'tex-mode-hook 'lsp)
  (add-hook 'latex-mode-hook 'lsp))

;;; eglot for C/C++
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode c++-ts-mode c-ts-mode) "clangd")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)

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
 '(auto-save-visited-mode t)
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(company-backends '(company-math-symbols-unicode))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2)
 '(completion-pcm-leading-wildcard t)
 '(completion-styles '(basic partial-completion))
 '(confirm-kill-processes nil)
 '(connection-local-criteria-alist
   '(((:application vc-git) vc-git-connection-default-profile)
     ((:application tramp :machine "ShengyiMacBook-Pro.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine
                    "dynamic-oit-ip4-wifirestricted01-10-16-217-168.princeton.edu")
      tramp-connection-local-darwin-ps-profile)
     ((:application eshell) eshell-connection-default-profile)
     ((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "ShengyideMacBook-Pro.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((vc-git-connection-default-profile (vc-git--program-version))
     (eshell-connection-default-profile (eshell-path-env-list))
     (tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string)
                                          (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . number)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))))
 '(consult-preview-at-point-mode-hook '(embark-collect-mode))
 '(custom-enabled-themes '(tron-legacy))
 '(custom-safe-themes
   '("7fd9e3ef1d713ffbf413ee6abf9cb0e6f7106cba6dea7c3e89fe1b3449cf99bd"
     "c87e2c5c3b8a4a0375e2cd73dcb9b8eb56e8f8da465d2bdad252d96de08764b5"
     "c5bfb24f5c6fbb099dcf13a51cb99804126a069bad6e18d8ed99e3bb536f72f2"
     "da161909c8b030d429176176392acc28e9e69f046e55f4919ba9840d15179840"
     "46821b856b14ed0c6fe6e11e6abeb5f8a575c2fd5ed4bcc33fbe52b7487ac20e"
     "0d09f49e81c811f4a661ff63b82d2b812ce034aed336903922b06362b8cb0bbe"
     "e80b1078c4ce2225f6f8d7621a55d3b675c86cad505b22b20243d4d075f491f5"
     "f0f5bfda176875f70299b2a3a07e778f23b8af81defe3bc40babd0a85f88d411"
     "cf9414f229f6df728eb2a5a9420d760673cca404fee9910551caf9c91cff3bfa"
     "c44380b9483c0808694bc2a721ca626cc1925f51f580dcefbc0fc072f1906111"
     "a5b0e366b1bf62133ae7c303a3b36b443a13aff40bf2bc0319143aba2caa4a87"
     "a21dcd2f5b8c38e799b9dcb91f702d5d864263a794732aa3ac05c73de070d1da"
     "6af9a4651ed0662d64b5ee15d74ce56d0421a3101caaf513687b74d7c42853f2"
     default))
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(emacs-lisp-mode-hook '(enable-paredit-mode))
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
 '(global-hl-line-mode t)
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
 '(lisp-mode-hook '(enable-paredit-mode))
 '(ls-lisp-dirs-first t)
 '(ls-lisp-use-insert-directory-program nil)
 '(lsp-headerline-breadcrumb-enable nil)
 '(major-mode-remap-alist
   '((c-mode . c-ts-mode) (c++-mode . c++-ts-mode)
     (html-mode . html-ts-mode)))
 '(marginalia-mode t)
 '(mood-line-glyph-alist
   '((:checker-info . 8627) (:checker-issues . 9873)
     (:checker-good . 10004) (:checker-checking . 10227)
     (:checker-errored . 10006) (:checker-interrupted . 9208)
     (:vc-added . 128932) (:vc-needs-merge . 10231)
     (:vc-needs-update . 8595) (:vc-conflict . 128932)
     (:vc-good . 10004) (:buffer-narrowed . 9660)
     (:buffer-modified . 9679) (:buffer-read-only . 9632)
     (:frame-client . 8645) (:count-separator . 10005)))
 '(mood-line-mode t)
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(ns-alternate-modifier 'super)
 '(ns-command-modifier 'meta)
 '(org-support-shift-select t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(async-status company-coq consult embark embark-consult gap-mode
                  geiser-chez geiser-guile geiser-racket haskell-mode
                  lean4-mode ligature magit marginalia mood-line
                  opam-switch-mode org-variable-pitch paredit
                  pdf-tools proof-general slime tron-legacy-theme
                  tuareg vertico which-key xbm-life yaml-mode))
 '(package-vc-selected-packages
   '((lean4-mode :url
                 "https://github.com/leanprover-community/lean4-mode.git")))
 '(pdf-view-use-imagemagick t)
 '(pdf-view-use-unicode-ligther nil)
 '(pixel-scroll-precision-mode t)
 '(python-shell-interpreter "/usr/local/bin/python3")
 '(read-buffer-completion-ignore-case t)
 '(scheme-mode-hook '(geiser-mode--maybe-activate enable-paredit-mode) t)
 '(scroll-bar-mode nil)
 '(switch-to-buffer-obey-display-actions t)
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
 '(vertico-count 12)
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
 '(yas-global-mode t))

;;; Coq 设置
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook #'opam-switch-mode)

(setq coq-highlight-hyps-cited-in-response nil)

;;; Lisp

(setq inferior-lisp-program "sbcl")

;;; 设置sokoban
;; (autoload 'sokoban "sokoban.el"
;;   "Start a new game of Sokoban." t)
;; (autoload 'sokoban-mode "sokoban.el"
;;   "Play Sokoban in current buffer." t)
;; (setq sokoban-levels-dir "c:/Useful/Open/emacs/site-lisp/sokoban-levels")

;; Python
;; (elpy-enable)
;; (setq elpy-rpc-python-command "python3")

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

(require 'tuareg)
(opam-switch-set-switch (tuareg-opam-current-compiler))
(let ((opam-share "~/.opam/default/share"))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)
    (require 'ocamlformat)
    (add-hook 'tuareg-mode-hook
              (lambda ()
                (define-key tuareg-mode-map (kbd "C-M-<tab>") #'ocamlformat)
                (add-hook 'before-save-hook #'ocamlformat-before-save)))
    (autoload 'utop "utop" "Toplevel for OCaml" t)
    (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
    (add-hook 'tuareg-mode-hook 'utop-minor-mode)
    (require 'ocp-indent)
    ;; To easily change opam switches within a given Emacs session, you can
    ;; install the minor mode https://github.com/ProofGeneral/opam-switch-mode
    ;; and use one of its "OPSW" menus.
    ))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 180 :family "Iosevka"))))
 '(org-default ((t nil)))
 '(org-document-title ((t (:foreground "#4BB5BE" :weight bold :height 1.5))))
 '(org-done ((t nil)))
 '(tab-bar ((t nil)))
 '(tab-bar-tab ((t (:inherit mode-line :background "#3D5666" :foreground "#CBECFF" :box (:line-width (4 . 3) :color "#3D5666" :style flat-button) :weight bold))))
 '(tab-bar-tab-inactive ((t (:inherit mode-line-inactive :background "#1E1E1E" :foreground "#90ACBC" :box (:line-width (4 . 3) :color "#1E1E1E" :style flat-button)))))
 '(variable-pitch ((t (:family "Libertinus Serif")))))

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

;; Local Variables:
;; mode: outline-minor;
;; End:
(provide 'init)
;;; init.el ends here

;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))
