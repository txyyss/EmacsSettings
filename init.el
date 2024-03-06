;;; package --- Summary -*- lexical-binding: t;-*-
;;; Commentary:


;; 快捷键提醒
;; C-c @ C-q 展示大纲模式，隐藏其它
;; C-c @ C-s 显示子节点

;; MELPA
(require 'package)
;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;; 设置环境变量
(setenv "PATH" (concat "~/.ghcup/bin:/opt/homebrew/bin:/opt/homebrew/sbin:~/.local/bin:/usr/local/bin:/Library/TeX/texbin:/Applications/Racket v8.12/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("~/.ghcup/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" "~/.local/bin" "/usr/local/bin" "/Library/TeX/texbin" "/Applications/Racket v8.12/bin")))
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
;; Iosevka Version = 28.1.0
;; Download from https://github.com/be5invis/Iosevka/releases

;;; 常用设置
(add-hook 'dired-mode-hook 'treemacs-icons-dired-mode)
(setq default-directory "~/")
(with-eval-after-load 'dired (load "dired-x"))
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(define-key global-map [ns-drag-file] 'ns-find-file)
(keymap-global-set "s-$" 'ispell-word)
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "s-/" 'dabbrev-expand)
(keymap-global-set "C-x m" 'toggle-frame-fullscreen)
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(toggle-frame-fullscreen)
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

(defun my-icomplete-styles ()
  (setq-local completion-styles '(basic partial-completion flex)))

;;; Org Mode 设置
(define-key global-map [?\C-c ?a] 'org-agenda)
(define-key global-map [?\C-c ?r] 'org-remember)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'org-variable-pitch-minor-mode)

;;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff"
    "#eeeeec"])
 '(backup-directory-alist '((".*" . "~/Downloads/")))
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(company-backends '(company-math-symbols-unicode))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2)
 '(confirm-kill-processes nil)
 '(connection-local-criteria-alist
   '(((:application tramp :machine
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
   '((eshell-connection-default-profile (eshell-path-env-list))
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
 '(delete-selection-mode t)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(emacs-lisp-mode-hook '(enable-paredit-mode))
 '(fido-mode t)
 '(gap-executable "/usr/local/bin/gap")
 '(gap-start-options '("-f" "-b" "-m" "2m" "-E"))
 '(geiser-chez-binary "chez")
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(icomplete-minibuffer-setup-hook '(my-icomplete-styles))
 '(icomplete-mode t)
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
 '(package-selected-packages
   '(async-status company-coq diminish flycheck gap-mode geiser
                  geiser-chez geiser-guile geiser-racket haskell-mode
                  ligature lsp-mode magit magit-section mood-line
                  opam-switch-mode org-variable-pitch paredit
                  proof-general transient treemacs-all-the-icons
                  treemacs-icons-dired tron-legacy-theme tuareg
                  which-key xbm-life))
 '(python-shell-interpreter "/usr/local/bin/python3")
 '(scheme-mode-hook '(geiser-mode--maybe-activate enable-paredit-mode) t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp))
 '(user-full-name "Shengyi Wang")
 '(vc-follow-symlinks t)
 '(visible-bell t)
 '(warning-suppress-log-types '((emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs)))
 '(winum-mode t))

;;; Coq 设置
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook #'opam-switch-mode)

(setq coq-highlight-hyps-cited-in-response nil)

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

(require 'diminish)
(diminish 'which-key-mode)
(diminish 'paredit-mode)

(require 'tuareg)
(opam-switch-set-switch (tuareg-opam-current-compiler))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 180 :family "Iosevka"))))
 '(org-default ((t nil)))
 '(org-document-title ((t (:foreground "#4BB5BE" :weight bold :height 1.5))))
 '(org-done ((t nil)))
 '(variable-pitch ((t (:family "Libertinus Serif")))))

(defun f2c (fahrenheit)
  (interactive "nFahrenheit (°F): ")
  (message "%s °C" (/ (* 5 (- fahrenheit 32)) 9.0)))

(defun c2f (celsius)
  (interactive "nCelsius (°C): ")
  (message "%s °F" (+ (/ (* celsius 9.0) 5.0) 32)))

;; Lean 4 mode
(setq load-path (cons "/Users/shengyiwang/Program/Lisp/lean4-mode" load-path))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(let ((need-to-refresh t))
  (dolist (p '(dash f flycheck lsp-mode magit-section s))
    (when (not (package-installed-p p))
      (when need-to-refresh
        (package-refresh-contents)
        (setq need-to-refresh nil))
      (package-install p))))

(require 'lean4-mode)

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
  (ligature-set-ligatures 'coq-mode ligatures-iosevka))

;; Local Variables:
;; mode: outline-minor;
;; End:
