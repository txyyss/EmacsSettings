;;; 快捷键提醒 
;; C-c @ C-q 展示大纲模式，隐藏其它 
;; C-c @ C-s 显示子节点

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


;;; 设置环境变量
(setenv "PATH" (concat "~/.local/bin:/usr/local/bin:/Library/TeX/texbin:/Applications/Racket v8.2/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("~/.local/bin" "/usr/local/bin" "/Library/TeX/texbin" "/Applications/Racket v8.2/bin")))
(setenv "LC_ALL" "en_US.UTF-8")

;;; 设置语言
(setq default-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(set-face-font 'default "Sarasa Mono SC-16")
;; Sarasa-Gothic Version = 0.34.1
;; Download from https://github.com/be5invis/Sarasa-Gothic/releases

;;; 常用设置
(setq default-directory "~/")
(global-set-key (kbd "C-x d") 'ido-dired)  
(setq-default c-basic-offset 4)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)
(define-key global-map [ns-drag-file] 'ns-find-file)
(global-set-key (kbd "<apps>") 'execute-extended-command)
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(setq doc-view-continuous t)
(toggle-frame-fullscreen)
(global-set-key [(meta f11)] 'toggle-frame-fullscreen)
(windmove-default-keybindings)

;;; Calender setting
(setq calendar-longitude 103.8)
(setq calendar-latitude 1.3667)
(setq calendar-location-name "Singapore")

;;; Spell checking
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "list")
(setq-default ispell-extra-args '("-a"))
(setq-default ispell-local-dictionary "en_US")
;; (setq-default ispell-local-dictionary-alist '(
;;              ("american" ; Yankee English
;;               "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US" "-i"  
;; "utf-8") nil utf-8)))


;;; Dictionary setting
;; (load "dictionary-init")
;; (setq dictionary-server "localhost")
;; (global-set-key (kbd "C-c s") 'dictionary-search)
;; (setq dictionary-use-single-buffer t)
;; (autoload 'lookup "lookup" nil t)
;; (autoload 'lookup-word "lookup" nil t)
;; (setq lookup-search-agents '((ndic "c:/Useful/Home")))
;; (global-set-key (kbd "C-c s") 'lookup-word)
 
;;; Org Mode 设置
(setq org-export-with-LaTeX-fragments t)
(setq org-tags-column -100)
(define-key global-map [?\C-c ?a] 'org-agenda)
(define-key global-map [?\C-c ?r] 'org-remember)
(setq org-enforce-todo-dependencies t)
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
 '(company-coq-disabled-features '(prettify-symbols smart-subscripts))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2)
 '(custom-enabled-themes '(tron-legacy))
 '(custom-safe-themes
   '("6af9a4651ed0662d64b5ee15d74ce56d0421a3101caaf513687b74d7c42853f2" default))
 '(delete-selection-mode t)
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(explicit-shell-file-name nil)
 '(gap-executable "/usr/local/bin/gap")
 '(gap-start-options '("-f" "-b" "-m" "2m" "-E"))
 '(geiser-chez-binary "chez")
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(latex-run-command "xelatex -shell-escape")
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(ns-command-modifier 'meta)
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage{fullpage}         % do not remove
\\usepackage{amssymb}
\\usepackage[usenames]{color}
\\usepackage{amsmath}
\\usepackage{latexsym}
\\usepackage[mathscr]{eucal}
\\newcommand{\\quasiregu}[2]{\\genfrac{\\{}{\\}}{0pt}{1}{#1}{#2}}
\\newcommand{\\dquasiregu}[2]{\\genfrac{\\{}{\\}}{0pt}{0}{#1}{#2}}
\\pagestyle{empty}             % do not remove")
 '(org-support-shift-select t)
 '(package-selected-packages
   '(tron-legacy-theme company-coq geiser-racket geiser-guile geiser-chez proof-general docker-tramp glsl-mode geiser paredit tuareg gap-mode csharp-mode elpy))
 '(python-shell-interpreter "/usr/local/bin/python3")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp))
 '(user-full-name "Shengyi Wang")
 '(visible-bell t))

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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;; mode: outline-minor;
;; End:
