;;; 快捷键提醒 
;; C-c @ C-q 展示大纲模式，隐藏其它 
;; C-c @ C-s 显示子节点

;;; 设置环境变量
(setenv "PATH" (concat "~/.local/bin:/usr/local/bin:/Library/TeX/texbin:" (getenv "PATH")))
(setq exec-path (append exec-path '("~/.local/bin" "/usr/local/bin" "/Library/TeX/texbin")))

;;; 设置语言
(setq default-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(set-face-font 'default "Sarasa Mono SC-16")
;; version = 0.5.0

;;; 常用设置
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq visible-bell t)
(tool-bar-mode 0)
(set-scroll-bar-mode nil)
(column-number-mode t)
(show-paren-mode t)
(setq display-time-24hr-format t)
(display-time-mode t)
(mouse-avoidance-mode 'animate)
(delete-selection-mode t)
(ido-mode t)
(global-set-key (kbd "C-x d") 'ido-dired)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
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

;;; Auto Pair
;; (setq skeleton-pair t)
;; (setq skeleton-pair-alist
;;       '((?\( _ ?\))
;;         (?[  _ ?])
;;         (?{  _ ?})
;;         (?\" _ ?\")))

;; (defun autopair-insert (arg)
;;   (interactive "P")
;;   (let (pair)
;;     (cond
;;      ((assq last-command-char skeleton-pair-alist)
;;       (autopair-open arg))
;;      (t
;;       (autopair-close arg)))))

;; (defun autopair-open (arg)
;;   (interactive "P")
;;   (let ((pair (assq last-command-char
;;                     skeleton-pair-alist)))
;;     (cond
;;      ((and (not mark-active)
;;            (eq (car pair) (car (last pair)))
;;            (eq (car pair) (char-after)))
;;       (autopair-close arg))
;;      (t
;;       (skeleton-pair-insert-maybe arg)))))

;; (defun autopair-close (arg)
;;   (interactive "P")
;;   (cond
;;    (mark-active
;;     (let (pair open)
;;       (dolist (pair skeleton-pair-alist)
;;         (when (eq last-command-char (car (last pair)))
;;           (setq open (car pair))))
;;       (setq last-command-char open)
;;       (skeleton-pair-insert-maybe arg)))
;;    ((looking-at
;;      (concat "[ \t\n]*"
;;              (regexp-quote (string last-command-char))))
;;     (replace-match (string last-command-char))
;;     (indent-according-to-mode))
;;    (t
;;     (self-insert-command (prefix-numeric-value arg))
;;     (indent-according-to-mode))))

;; (defun autopair-backspace (arg)
;;   (interactive "p")
;;   (if (eq (char-after)
;;           (car (last (assq (char-before) skeleton-pair-alist))))
;;       (and (char-after) (delete-char 1)))
;;   (delete-backward-char arg))

;; (global-set-key [backspace] 'autopair-backspace)

;; (global-set-key "("  'autopair-insert)
;; (global-set-key "["  'autopair-insert)
;; (global-set-key "{"  'autopair-insert)
;; (global-set-key "\"" 'autopair-insert)
;; (add-hook 'c-mode-common-hook
;;               '(lambda ()
;;                  (local-set-key "(" 'autopair-insert)
;;                  (local-set-key "{" 'autopair-insert)))

;;; Org Mode 设置
(setq org-export-with-LaTeX-fragments t)
(setq org-tags-column -100)
(define-key global-map [?\C-c ?a] 'org-agenda)
(define-key global-map [?\C-c ?r] 'org-remember)
(setq org-enforce-todo-dependencies t)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook 'abbrev-mode)
;;; graphviz 设置
;; (load "~/site-lisp/graphviz-dot-mode")

;;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(company-coq-disabled-features (quote (prettify-symbols smart-subscripts)))
 '(custom-enabled-themes (quote (tango-dark)))
 '(gap-executable "/usr/local/bin/gap")
 '(gap-start-options (quote ("-f" "-b" "-m" "2m" "-E")))
 '(ns-command-modifier (quote meta))
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
 '(package-selected-packages
   (quote
    (tuareg gap-mode csharp-mode elpy haskell-mode company-coq)))
 '(tramp-syntax (quote default) nil (tramp))
 '(user-full-name "Shengyi Wang"))
;; (eval-after-load "haskell-mode"
;;        '(progn
;;          (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;;          (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;          (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;          (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;;          (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;          (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;          (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;          (define-key haskell-mode-map (kbd "C-c C-n") 'haskell-check)))

;;; 设置 SLIME
;; (add-to-list 'load-path "~/site-lisp/slime")
;; (setq inferior-lisp-program "/Users/moonstone/Open/ccl/dx86cl64 -I /Users/moonstone/Open/ccl/dx86cl64.image -K utf-8")
;; (setq slime-lisp-implementations
;;       '((ccl ("/Users/moonstone/Open/ccl/dx86cl64" "-I" "/Users/moonstone/Open/ccl/dx86cl64.image")
;;              :coding-system utf-8-unix)))
;; (require 'slime-autoloads)
;; (slime-setup)
;; (slime-setup '(slime-repl))

;;; Markdown 设置
(add-to-list 'load-path "~/site-lisp/markdown-mode")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(autoload 'gfm-mode "markdown-mode" "GitHub Flavored Markdown mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;; 自动变主题
;; (add-to-list 'load-path "~/site-lisp/theme-changer")
;; (load "theme-changer")
;; (change-theme 'tango 'tango-dark)

;;; OCaml Mode
;; (add-to-list 'load-path "~/site-lisp/tuareg")
;; (load "tuareg-site-file")

;;; Coq 设置
(load "~/site-lisp/PG/generic/proof-site")
(add-hook 'coq-mode-hook #'company-coq-mode)

;;; Agda 设置
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))

;;; LaTeX
(setq latex-run-command "xelatex -shell-escape")

;;; TRAMP
(setq tramp-default-method "ssh")
(setq tramp-default-user "shengyi" tramp-default-host "loris-7.ddns.comp.nus.edu.sg")

;;; 设置sokoban
;; (autoload 'sokoban "sokoban.el"
;;   "Start a new game of Sokoban." t)
;; (autoload 'sokoban-mode "sokoban.el"
;;   "Play Sokoban in current buffer." t)
;; (setq sokoban-levels-dir "c:/Useful/Open/emacs/site-lisp/sokoban-levels")

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

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

(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;; mode: outline-minor;
;; End:
