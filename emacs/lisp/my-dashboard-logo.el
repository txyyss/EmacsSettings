;;; my-dashboard-logo.el --- Logo data for the startup dashboard -*- lexical-binding: t; -*-

;;; Commentary:

;; This is an Emacs-native copy of the artwork that was originally
;; converted from fastfetch/logos/NameFastFetch4.txt.  It deliberately has
;; no runtime dependency on the Fastfetch configuration.

;;; Code:

(defface my-dashboard-logo-red
  '((t (:inherit fixed-pitch :foreground "#cc0000")))
  "Red face used by the dashboard logo."
  :group 'faces)

(defface my-dashboard-logo-light
  '((t (:inherit fixed-pitch :foreground "#e6e6dc")))
  "Light face used by the dashboard logo."
  :group 'faces)

(defconst my-dashboard-logo--source-lines
  '("██████████████████████████████████🮏  ██████████████████████████🮏 ██████🮏  ██████████████████🮏 ██████████████🮏"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎   🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒  🮎🮎🮎██▒  ██▒🮎🮎🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎 ██▒🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎"
    "██████████████████████████████████🮏  ██████████████████████🮏 ██████████▒  ██▒ ██████████████🮏 ██████████████🮏"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎 ██▒🮎🮎🮎🮎🮎🮎🮎🮎  ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒"
    "██████████████🮏 ██▒ ██████████████🮏  ██████████████████████████████████🮏  ██▒ ██████🮏 ██████▒ ██████████████▒"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎🮎🮎  ██▒  🮎🮎🮎██▒ ██▒🮎🮎🮎🮎 ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒"
    "██████████████▒ ██▒ ██████████████🮏  ██▒ ██████████████████🮏 ██▒ ██████🮏  ██▒ ██████▒ ██████🮏 ██████████████▒"
    "██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎 ██▒  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒  ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒ ██▒🮎🮎🮎🮎  ██▒ ██▒🮎🮎🮎🮎  🮎🮎🮎██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒"
    "██████████████🮏 ██▒ ██████████████▒  ██▒ ██████🮏 ██🮏 ██████▒ ██████████🮏  ██▒ ██████🮏 ██████▒ ██████████████▒"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  ██▒  🮎🮎🮎██▒ ██▒ ██▒🮎🮎🮎🮎  🮎🮎🮎██▒🮎🮎🮎🮎  ██▒  🮎🮎🮎██▒ ██▒🮎🮎🮎🮎  🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎"
    "██████████████▒ ██▒ ██████████████🮏  ██▒ ██████▒ ██▒ ██████🮏 ██████████🮏  ██▒ ██████▒ ██████🮏 ██████████████🮏"
    "██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎 ██▒  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒   🮎🮎  🮎🮎🮎🮎🮎🮎  🮎🮎  🮎🮎🮎🮎🮎🮎  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  ██▒ ██▒🮎🮎🮎🮎  🮎🮎🮎██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒"
    "██████████████🮏 ██▒ ██████████████▒  ██████████████████████████████████🮏  ██▒ ██████████████▒ ██▒ ██████████▒"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎   🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒🮎██▒🮎██▒🮎██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  ██▒  🮎🮎🮎🮎🮎██▒🮎🮎🮎🮎🮎🮎 ██▒ ██▒🮎🮎🮎🮎🮎🮎🮎🮎"
    "██████████████▒ ██▒ ██████████████🮏  ████████████▒ ██▒ ██▒ ████████████🮏  ██████████████████🮏 ██▒ ██████████🮏"
    "██▒🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎 ██▒  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒   🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎 ██▒ ██▒  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎   🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎██▒ ██▒  🮎🮎🮎🮎🮎🮎🮎██▒"
    "██████████████████████████████████▒  ██████████████████████████████████🮏  ██████████████████▒ ██▒ ██████████▒"
    " 🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎   🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎   🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎  🮎🮎  🮎🮎🮎🮎🮎🮎🮎🮎🮎🮎")
  "The dashboard logo without Fastfetch color markers.")

(defconst my-dashboard-logo-lines
  (let ((first-ranges '((0 17 my-dashboard-logo-red)
                        (17 74 my-dashboard-logo-light)
                        (74 94 my-dashboard-logo-red)
                        (94 109 my-dashboard-logo-light)))
        (last-ranges '((0 17 my-dashboard-logo-red)
                       (17 37 my-dashboard-logo-light)
                       (37 94 my-dashboard-logo-red)
                       (94 109 my-dashboard-logo-light)))
        (index 0)
        rendered-lines)
    (dolist (source-line my-dashboard-logo--source-lines
                         (nreverse rendered-lines))
      (let ((line (copy-sequence source-line))
            (ranges (if (< index 12) first-ranges last-ranges)))
        (dolist (range ranges)
          (add-face-text-property
           (nth 0 range) (nth 1 range) (nth 2 range) nil line))
        (push line rendered-lines)
        (setq index (1+ index)))))
  "Dashboard logo lines with native Emacs face properties.")

(provide 'my-dashboard-logo)

;;; my-dashboard-logo.el ends here
