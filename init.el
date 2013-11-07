;;; 快捷键提醒 
;; C-c @ C-q 展示大纲模式，隐藏其它 
;; C-c @ C-s 显示子节点

;;; 设置环境变量
(setenv "PATH" (concat "/Users/moonstone/Library/Haskell/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/Users/moonstone/Library/Haskell/bin" "/opt/local/bin" "/opt/local/sbin" "/usr/local/bin" "/usr/texbin" "/usr/X11/bin")))

;;; 设置语言
(setq default-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq system-time-locale "C")

;;; 设置字体
(set-face-font 'default "DejaVu Sans Mono-18:antialias=natural")
(setq dejavu-sans-mono-range
      '((160 . 451) (461 . 483) (486 . 496) (500 . 502) (504 . 505)
        (508 . 545) (548 . 577) (579 . 581) (588 . 589) (592 . 697)
        (699 . 705) (710 . 713) (716 . 717) (720 . 723) (726 . 734)
        (736 . 745) (750 . 750) (755 . 755) (768 . 831) (835 . 835)
        (856 . 856) (865 . 865) (884 . 885) (890 . 890) (894 . 894)
        (900 . 906) (908 . 908) (910 . 929) (931 . 974) (976 . 993)
        (1008 . 1119) (1122 . 1123) (1138 . 1139) (1168 . 1179)
        (1186 . 1189) (1194 . 1203) (1210 . 1211) (1216 . 1220)
        (1223 . 1224) (1227 . 1228) (1231 . 1273) (1296 . 1297)
        (1306 . 1309) (1329 . 1366) (1369 . 1375) (1377 . 1415)
        (1417 . 1418) (1542 . 1543) (1545 . 1546) (1548 . 1548)
        (1557 . 1557) (1563 . 1563) (1567 . 1567) (1569 . 1594)
        (1600 . 1621) (1626 . 1626) (1632 . 1645) (1652 . 1652)
        (1657 . 1659) (1662 . 1664) (1667 . 1668) (1670 . 1671)
        (1681 . 1681) (1688 . 1688) (1700 . 1700) (1705 . 1705)
        (1711 . 1711) (1726 . 1726) (1740 . 1740) (1776 . 1785)
        (3713 . 3714) (3716 . 3716) (3719 . 3720) (3722 . 3722)
        (3725 . 3725) (3732 . 3735) (3737 . 3743) (3745 . 3747)
        (3749 . 3749) (3751 . 3751) (3754 . 3755) (3757 . 3769)
        (3771 . 3772) (3784 . 3789) (4304 . 4348) (7426 . 7426)
        (7432 . 7433) (7444 . 7444) (7446 . 7447) (7453 . 7455)
        (7468 . 7470) (7472 . 7484) (7486 . 7515) (7522 . 7525)
        (7543 . 7544) (7547 . 7547) (7557 . 7557) (7579 . 7607)
        (7609 . 7615) (7680 . 7699) (7704 . 7725) (7728 . 7757)
        (7764 . 7779) (7784 . 7801) (7804 . 7833) (7835 . 7835)
        (7839 . 7841) (7852 . 7853) (7856 . 7857) (7862 . 7865)
        (7868 . 7869) (7878 . 7879) (7882 . 7885) (7896 . 7901)
        (7904 . 7909) (7912 . 7915) (7918 . 7925) (7928 . 7929)
        (7936 . 7957) (7960 . 7965) (7968 . 8005) (8008 . 8013)
        (8016 . 8023) (8025 . 8025) (8027 . 8027) (8029 . 8029)
        (8031 . 8061) (8064 . 8116) (8118 . 8132) (8134 . 8147)
        (8150 . 8155) (8157 . 8175) (8178 . 8180) (8182 . 8190)
        (8192 . 8202) (8208 . 8213) (8215 . 8227) (8230 . 8230)
        (8239 . 8247) (8249 . 8250) (8252 . 8254) (8261 . 8265)
        (8267 . 8267) (8287 . 8287) (8304 . 8305) (8308 . 8334)
        (8336 . 8348) (8352 . 8373) (8376 . 8377) (8450 . 8450)
        (8453 . 8453) (8461 . 8463) (8469 . 8471) (8473 . 8474)
        (8477 . 8477) (8482 . 8482) (8484 . 8484) (8486 . 8486)
        (8490 . 8491) (8494 . 8494) (8531 . 8543) (8592 . 8717)
        (8719 . 8719) (8721 . 8723) (8725 . 8725) (8727 . 8736)
        (8743 . 8749) (8756 . 8765) (8769 . 8809) (8813 . 8843)
        (8847 . 8850) (8853 . 8869) (8901 . 8902) (8909 . 8909)
        (8922 . 8937) (8943 . 8943) (8960 . 8966) (8968 . 8981)
        (8984 . 8985) (8988 . 8993) (8997 . 9000) (9003 . 9003)
        (9013 . 9013) (9015 . 9022) (9025 . 9028) (9031 . 9033)
        (9035 . 9037) (9040 . 9040) (9042 . 9044) (9047 . 9052)
        (9054 . 9056) (9059 . 9061) (9064 . 9065) (9067 . 9072)
        (9075 . 9082) (9085 . 9085) (9088 . 9091) (9096 . 9099)
        (9109 . 9109) (9115 . 9134) (9166 . 9167) (9251 . 9251)
        (9472 . 9775) (9784 . 9867) (9872 . 9884) (9888 . 9889)
        (9904 . 9905) (9985 . 9988) (9990 . 9993) (9996 . 10023)
        (10025 . 10059) (10061 . 10061) (10063 . 10066) (10070 . 10070)
        (10072 . 10078) (10081 . 10101) (10132 . 10132) (10136 . 10159)
        (10161 . 10174) (10181 . 10182) (10208 . 10208) (10216 . 10217)
        (10731 . 10731) (10746 . 10747) (10799 . 10799) (11026 . 11034)
        (11364 . 11364) (11373 . 11376) (11381 . 11383) (11385 . 11386)
        (11388 . 11391) (11800 . 11800) (11810 . 11813) (11822 . 11822)
        (42760 . 42774) (42779 . 42783) (42786 . 42791) (42889 . 42894)
        (42896 . 42897) (63173 . 63173) (64257 . 64258) (64338 . 64385)
        (64394 . 64405) (64414 . 64415) (64426 . 64429) (64488 . 64489)
        (64508 . 64511) (65136 . 65140) (65142 . 65276) (65279 . 65279)
        (65529 . 65533) (120432 . 120483)))
(setq dejavu-sans-range
      '((452 . 460) (484 . 485) (497 . 499) (503 . 503) (506 . 507)
        (546 . 547) (578 . 578) (582 . 587) (590 . 591) (698 . 698)
        (706 . 709) (714 . 715) (718 . 719) (724 . 725) (735 . 735)
        (748 . 749) (759 . 759) (832 . 834) (836 . 847) (849 . 851)
        (855 . 855) (858 . 858) (860 . 864) (866 . 866) (880 . 883)
        (886 . 887) (891 . 893) (975 . 975) (994 . 1007) (1120 . 1121)
        (1124 . 1137) (1140 . 1167) (1180 . 1185) (1190 . 1193)
        (1204 . 1209) (1212 . 1215) (1221 . 1222) (1225 . 1226)
        (1229 . 1230) (1274 . 1295) (1298 . 1305) (1310 . 1317)
        (1456 . 1475) (1478 . 1479) (1488 . 1514) (1520 . 1524)
        (1623 . 1623) (1646 . 1648) (1660 . 1661) (1665 . 1666)
        (1669 . 1669) (1672 . 1680) (1682 . 1687) (1689 . 1699)
        (1701 . 1704) (1706 . 1710) (1712 . 1725) (1727 . 1727)
        (1734 . 1734) (1742 . 1742) (1749 . 1749) (1984 . 2023)
        (2027 . 2037) (2040 . 2042) (3647 . 3647) (3773 . 3773)
        (3776 . 3780) (3782 . 3782) (3792 . 3801) (3804 . 3805)
        (4256 . 4293) (5121 . 5127) (5129 . 5147) (5149 . 5173)
        (5175 . 5194) (5196 . 5202) (5204 . 5309) (5312 . 5354)
        (5356 . 5383) (5392 . 5438) (5440 . 5456) (5458 . 5482)
        (5492 . 5509) (5514 . 5526) (5536 . 5551) (5598 . 5598)
        (5601 . 5601) (5702 . 5703) (5742 . 5750) (5760 . 5788)
        (7424 . 7425) (7427 . 7431) (7434 . 7443) (7448 . 7452)
        (7456 . 7459) (7462 . 7467) (7485 . 7485) (7517 . 7521)
        (7526 . 7530) (7549 . 7549) (7608 . 7608) (7620 . 7625)
        (7700 . 7703) (7726 . 7727) (7758 . 7763) (7780 . 7783)
        (7802 . 7803) (7834 . 7834) (7836 . 7838) (7842 . 7851)
        (7854 . 7855) (7858 . 7861) (7866 . 7867) (7870 . 7877)
        (7880 . 7881) (7886 . 7895) (7902 . 7903) (7910 . 7911)
        (7916 . 7917) (7926 . 7927) (7930 . 7931) (8203 . 8207)
        (8214 . 8214) (8228 . 8229) (8231 . 8238) (8248 . 8248)
        (8251 . 8251) (8255 . 8260) (8266 . 8266) (8268 . 8286)
        (8288 . 8292) (8298 . 8303) (8400 . 8401) (8406 . 8407)
        (8411 . 8412) (8417 . 8417) (8448 . 8449) (8451 . 8452)
        (8454 . 8457) (8459 . 8460) (8464 . 8468) (8472 . 8472)
        (8475 . 8476) (8478 . 8481) (8483 . 8483) (8485 . 8485)
        (8487 . 8489) (8492 . 8493) (8495 . 8521) (8523 . 8523)
        (8526 . 8526) (8528 . 8530) (8544 . 8581) (8585 . 8585)
        (8718 . 8718) (8720 . 8720) (8724 . 8724) (8726 . 8726)
        (8737 . 8742) (8750 . 8755) (8766 . 8768) (8810 . 8812)
        (8844 . 8846) (8851 . 8852) (8870 . 8900) (8903 . 8908)
        (8910 . 8921) (8938 . 8942) (8944 . 8959) (8967 . 8967)
        (8996 . 8996) (9004 . 9004) (9095 . 9095) (9108 . 9108)
        (9187 . 9187) (9189 . 9189) (9192 . 9192) (9250 . 9250)
        (9312 . 9321) (9776 . 9783) (9868 . 9871) (9890 . 9903)
        (9906 . 9912) (9920 . 9923) (9954 . 9954) (10102 . 10131)
        (10214 . 10215) (10218 . 10219) (10224 . 10495) (10502 . 10503)
        (10506 . 10507) (10560 . 10561) (10627 . 10628) (10702 . 10709)
        (10752 . 10754) (10764 . 10780) (10877 . 10912) (10926 . 10938)
        (11001 . 11002) (11008 . 11025) (11039 . 11044) (11091 . 11092)
        (11360 . 11363) (11365 . 11372) (11377 . 11380) (11387 . 11387)
        (11568 . 11621) (11631 . 11631) (19904 . 19967) (42564 . 42567)
        (42572 . 42573) (42576 . 42577) (42580 . 42583) (42594 . 42606)
        (42634 . 42637) (42644 . 42645) (42792 . 42795) (42800 . 42815)
        (42822 . 42827) (42830 . 42835) (42838 . 42839) (42852 . 42855)
        (42880 . 42883) (43002 . 43007) (61184 . 61209) (61440 . 61443)
        (64256 . 64256) (64259 . 64262) (64275 . 64279) (64285 . 64310)
        (64312 . 64316) (64318 . 64318) (64320 . 64321) (64323 . 64324)
        (64326 . 64335) (64386 . 64393) (64406 . 64413) (64416 . 64419)
        (64467 . 64470) (64473 . 64474) (65024 . 65039) (65056 . 65059)
        (66304 . 66334) (66336 . 66339) (119552 . 119638)
        (120120 . 120121) (120123 . 120126) (120128 . 120132)
        (120134 . 120134) (120138 . 120144) (120146 . 120171)
        (120224 . 120275) (120792 . 120811) (127024 . 127123)
        (127136 . 127150) (127153 . 127166) (127169 . 127183)
        (127185 . 127199) (128045 . 128046) (128049 . 128049)
        (128053 . 128053) (128513 . 128528) (128530 . 128532)
        (128534 . 128534) (128536 . 128536) (128538 . 128538)
        (128540 . 128542) (128544 . 128547) (128549 . 128549)
        (128552 . 128555) (128557 . 128557) (128560 . 128563)))
(setq microsoft-yahei-range
      '((9332 . 9371) (11905 . 11905) (11908 . 11908) (11912 . 11912)
        (11915 . 11916) (11927 . 11927) (11943 . 11943) (11946 . 11946)
        (11950 . 11950) (11955 . 11955) (11958 . 11959) (11963 . 11963)
        (12288 . 12351) (12353 . 12438) (12441 . 12543) (12549 . 12587)
        (12688 . 12727) (12784 . 12799) (12963 . 12963) (13262 . 13262)
        (13265 . 13266) (13269 . 13269) (13312 . 19893) (19968 . 40869)
        (40884 . 40889) (40891 . 40891) (63788 . 63788) (63865 . 63865)
        (63893 . 63893) (63975 . 63975) (63985 . 63985) (64012 . 64015)
        (64017 . 64017) (64019 . 64020) (64024 . 64024) (64031 . 64033)
        (64035 . 64036) (64039 . 64041) (65040 . 65049) (65072 . 65106)
        (65108 . 65126) (65128 . 65131) (65281 . 65439) (65441 . 65470)
        (65474 . 65479) (65482 . 65487) (65490 . 65495) (65498 . 65500)
        (65504 . 65510)))
(defun set-accurate-font (range name)
  (set-fontset-font "fontset-default" range
                    (font-spec :name (concat name ":antialias=natural"))))
(mapcar #'(lambda (range) (set-accurate-font range "DejaVu Sans Mono")) dejavu-sans-mono-range)
(mapcar #'(lambda (range) (set-accurate-font range "DejaVu Sans")) dejavu-sans-range)
(mapcar #'(lambda (range) (set-accurate-font range "Microsoft YaHei")) microsoft-yahei-range)

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
(define-key global-map [ns-drag-file] 'ns-find-file)
(global-set-key (kbd "<apps>") 'execute-extended-command)

(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(setq doc-view-continuous t)

;;; Calender setting
(setq calendar-longitude 116.3)
(setq calendar-latitude 40)
(setq calendar-location-name "Peking University")

;;; Spell checking
(setq-default ispell-program-name "/opt/local/bin/hunspell")
(setq-default ispell-extra-args '("-a"))
(setq-default ispell-local-dictionary "american")
(setq-default ispell-local-dictionary-alist '(
             ("american" ; Yankee English
              "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US" "-i"  
"utf-8") nil utf-8)))


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
(load "~/site-lisp/graphviz-dot-mode")

;;; Haskell 设置
(add-to-list 'load-path "~/site-lisp/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

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

;;; OCaml Mode
(add-to-list 'load-path "~/site-lisp/tuareg")
(load "tuareg-site-file")

;;; Coq 设置
(load-file "/Users/moonstone/site-lisp/ProofGeneral/generic/proof-site.el")
(setq coq-use-project-file nil)

;;; Agda 设置
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;;; LaTeX
(setq latex-run-command "xelatex")

;;; TRAMP
(setq tramp-default-method "ssh")
(setq tramp-default-user "shengyi" tramp-default-host "loris-7.ddns.comp.nus.edu.sg")

;;; Abbrev-Mode settings
(setq save-abbrevs nil)
(define-abbrev-table 'text-mode-abbrev-table
 '(("xalpha" "α") ("xbeta" "β") ("xgamma" "γ") ("xdelta" "δ") ("xepsilon" "ε")
   ("xzeta" "ζ") ("xeta" "η") ("xtheta" "θ") ("xiota" "ι") ("xkappa" "κ")
   ("xlambda" "λ") ("xmu" "μ") ("xnu" "ν") ("xxi" "ξ") ("xomicron" "ο")
   ("xpi" "π") ("xrho" "ρ") ("xfinalsigma" "ς") ("xsigma" "σ") ("xtau" "τ")
   ("xupsilon" "υ") ("xphi" "φ") ("xchi" "χ") ("xpsi" "ψ") ("xomega" "ω")
   ("xforall" "∀") ("xpartial" "∂") ("xexists" "∃") ("xin" "∈") ("xto" "→")
   ("xsum" "∑") ("xprod" "∏") ("xcirc" "∘") ("xbullet" "∙") ("xpm" "±")
   ("xmp" "∓") ("xcap" "∩") ("xcup" "∪") ("xcdot" "·") ("xmapsto" "↦")
   ("xtimes" "×") ("xvee" "∨") ("xwedge" "∧") ("xsubset" "⊂") ("xsupset" "⊃")
   ("xsubseteq" "⊆") ("xsupseteq" "⊇") ("xlhd" "◁") ("xrhd" "▷")
   ("xinverse" "⁻¹") ("xu0" "⁰") ("xu1" "¹") ("xu2" "²") ("xu3" "³")
   ("xu4" "⁴") ("xu5" "⁵") ("xu6" "⁶") ("xu7" "⁷") ("xu8" "⁸") ("xu9" "⁹")
   ("xui" "ⁱ") ("xun" "ⁿ") ("xuplus" "⁺") ("xuminus" "⁻") ("xinfty" "∞")
   ("xnin" "∉") ("xl0" "₀") ("xl1" "₁") ("xl2" "₂") ("xl3" "₃") ("xl4" "₄")
   ("xl5" "₅") ("xl6" "₆") ("xl7" "₇") ("xl8" "₈") ("xl9" "₉") ("xldots" "…")
   ("xcdots" "⋯")))

;;; 设置sokoban
;; (autoload 'sokoban "sokoban.el"
;;   "Start a new game of Sokoban." t)
;; (autoload 'sokoban-mode "sokoban.el"
;;   "Play Sokoban in current buffer." t)
;; (setq sokoban-levels-dir "c:/Useful/Open/emacs/site-lisp/sokoban-levels")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
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
 '(user-full-name "Shengyi Wang"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "DejaVu Sans Mono"))))
 '(lookup-heading-1-face ((t (:weight bold))) t)
 '(tex-verbatim ((t nil)) t)
 '(variable-pitch ((t (:family "DejaVu Sans")))))

;; Local Variables:
;; mode: outline-minor;
;; End:
