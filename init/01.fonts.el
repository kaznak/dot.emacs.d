;;; 01.characters.el --- Emacs font Configurations

;; ;; MigMix 1MをEmacsのデフォルトのフォントに
;; (add-to-list 'default-frame-alist '(font . "MigMix 1M"))

;; ;; 英語
(set-face-attribute 'default nil
 		    :family "Menlo" ;; font
 		    :height 150)    ;; font size

;; ;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Mincho Pro")) ;; font
;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; ;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
      '((".*Hiragino_Mincho_pro.*" . 1.2)))
;;       '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

(set-face-attribute 'default nil :family "Menlo" :height 140)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN"))
(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))

