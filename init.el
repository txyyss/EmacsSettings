;;; 快捷键提醒
;; C-c @ C-q 展示大纲模式，隐藏其它
;; C-c @ C-s 显示子节点

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;; 设置环境变量
(setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/sbin:~/.local/bin:/usr/local/bin:/Library/TeX/texbin:/Applications/Racket v8.6/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/homebrew/bin" "/opt/homebrew/sbin" "~/.local/bin" "/usr/local/bin" "/Library/TeX/texbin" "/Applications/Racket v8.6/bin")))
(setenv "LC_ALL" "en_US.UTF-8")

;;; 设置语言
(setq default-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(set-face-font 'default "Sarasa Mono SC-18")
;; Sarasa-Gothic Version = 0.36.8
;; Download from https://github.com/be5invis/Sarasa-Gothic/releases

;;; 常用设置
(add-hook 'dired-mode-hook 'treemacs-icons-dired-mode)
(setq default-directory "~/")
(global-set-key (kbd "C-x d") 'ido-dired)
(setq-default c-basic-offset 4)
(with-eval-after-load 'dired (load "dired-x"))
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(define-key global-map [ns-drag-file] 'ns-find-file)
(global-set-key (kbd "<apps>") 'execute-extended-command)
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(setq doc-view-continuous t)
(toggle-frame-fullscreen)
(global-set-key [(meta f11)] 'toggle-frame-fullscreen)
(add-hook 'before-save-hook
          (lambda ()
            (when (and (not (string-match ".*makefile.*" (message "%s" major-mode)))
                       (or (derived-mode-p 'prog-mode)
                           (eq major-mode 'coq-mode)))
              (delete-trailing-whitespace))))

;;; Calender setting
(setq calendar-longitude 103.8)
(setq calendar-latitude 1.3667)
(setq calendar-location-name "Singapore")

;;; Spell checking
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq-default ispell-extra-args '("-a"))
(setq-default ispell-local-dictionary "en_US")

(which-key-mode)

;;; Org Mode 设置
(define-key global-map [?\C-c ?a] 'org-agenda)
(define-key global-map [?\C-c ?r] 'org-remember)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook 'abbrev-mode)

;;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-backends '(company-math-symbols-unicode))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2)
 '(custom-enabled-themes '(tron-legacy))
 '(custom-safe-themes
   '("e80b1078c4ce2225f6f8d7621a55d3b675c86cad505b22b20243d4d075f491f5" "f0f5bfda176875f70299b2a3a07e778f23b8af81defe3bc40babd0a85f88d411" "cf9414f229f6df728eb2a5a9420d760673cca404fee9910551caf9c91cff3bfa" "c44380b9483c0808694bc2a721ca626cc1925f51f580dcefbc0fc072f1906111" "a5b0e366b1bf62133ae7c303a3b36b443a13aff40bf2bc0319143aba2caa4a87" "a21dcd2f5b8c38e799b9dcb91f702d5d864263a794732aa3ac05c73de070d1da" "6af9a4651ed0662d64b5ee15d74ce56d0421a3101caaf513687b74d7c42853f2" default))
 '(delete-selection-mode t)
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(doom-modeline-buffer-encoding 'nondefault)
 '(doom-modeline-height 0)
 '(doom-modeline-mode t)
 '(explicit-shell-file-name "/bin/bash")
 '(gap-executable "/usr/local/bin/gap")
 '(gap-start-options '("-f" "-b" "-m" "2m" "-E"))
 '(geiser-chez-binary "chez")
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(latex-run-command "xelatex -shell-escape")
 '(ls-lisp-dirs-first t)
 '(ls-lisp-use-insert-directory-program nil)
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(ns-command-modifier 'meta)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(doom-modeline company-coq proof-general xbm-life geiser-chicken treemacs-icons-dired treemacs-all-the-icons treemacs winum rustic diminish which-key lsp-ui flycheck tuareg tron-legacy-theme geiser-racket geiser-guile glsl-mode geiser paredit gap-mode elpy))
 '(python-shell-interpreter "/usr/local/bin/python3")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp))
 '(user-full-name "Shengyi Wang")
 '(visible-bell t)
 '(warning-suppress-log-types '((emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs)))
 '(winum-mode t))

;;; Coq 设置
(add-hook 'coq-mode-hook #'company-coq-mode)
(setq coq-highlight-hyps-cited-in-response nil)

;;; 设置sokoban
;; (autoload 'sokoban "sokoban.el"
;;   "Start a new game of Sokoban." t)
;; (autoload 'sokoban-mode "sokoban.el"
;;   "Play Sokoban in current buffer." t)
;; (setq sokoban-levels-dir "c:/Useful/Open/emacs/site-lisp/sokoban-levels")

;; Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")

;;; ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;; Rust
(add-hook 'rustic-mode-hook 'yas-minor-mode)

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
(tuareg-opam-update-env (tuareg-opam-current-compiler))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:family "Libertinus Serif")))))

(custom-set-icons
 ;; custom-set-icons was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

;; Local Variables:
;; mode: outline-minor;
;; End:
