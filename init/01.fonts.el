;; 01.characters.el --- Emacs font Configurations

;; https://extra-vision.blogspot.jp/2016/07/emacs.html

(create-fontset-from-ascii-font  "花園明朝A" nil  "Hanazono_MinchoA")
(set-fontset-font "fontset-Hanazono_MinchoA"  'unicode  "花園明朝A" nil 'append)
(add-to-list 'default-frame-alist '(font . "fontset-Hanazono_MinchoA"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "-PfEd-花園明朝A-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-PfEd-花園明朝B-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"

(create-fontset-from-ascii-font  "Takaoゴシック"  nil  "Takao_Gothic")
(set-fontset-font  "fontset-Takao_Gothic"  'unicode  "Takaoゴシック" nil 'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-Takao_Gothic"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "-IPA -TakaoEx明朝-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-IPA -TakaoExゴシック-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-IPA -Takao Pゴシック-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-IPA -Takao P明朝-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-IPA -Takao明朝-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-IPA -Takaoゴシック-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"

(create-fontset-from-ascii-font "IPAゴシック" nil "IPA_Ghothic")
(set-fontset-font "fontset-IPA_Ghothic" 'unicode "IPAゴシック" nil 'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-IPA_Ghothic"))

(create-fontset-from-ascii-font "IPA明朝" nil "IPA_Mincho")
(set-fontset-font "fontset-IPA_Mincho" 'unicode "IPA明朝" nil 'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-IPA_Mincho"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "-IPA -IPA明朝-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-IPA -IPAゴシック-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-IPA -IPAゴシック-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-IPA -IPA P明朝-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-IPA -IPA明朝-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
;; "-IPA -IPA Pゴシック-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"

(create-fontset-from-ascii-font "Ricty" nil "Ricty")
(set-fontset-font "fontset-Ricty" 'unicode "Ricty" nil 'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-Ricty"))

(create-fontset-from-ascii-font "Ricty Discord" nil "Ricty_Discord")
(set-fontset-font "fontset-Ricty_Discord" 'unicode "Ricty Discord" nil 'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-Ricty_Discord"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "-PfEd-Ricty-bold-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-PfEd-Ricty-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-PfEd-Ricty Discord-bold-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;; "-PfEd-Ricty Discord-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; MigMix 1MをEmacsのデフォルトのフォントに
;; (add-to-list 'default-frame-alist '(font . "MigMix 1M"))
;; 
;; (when (find-font (font-spec :name "Myrica M")) ;; 等幅フォント Myrca を使用
;;   (add-to-list 'default-frame-alist '(font . "Myrica M")) )

;; Mac OS
;; (when (eq system-type 'darwin)
;;   ;; ;; 英語
;;   (set-face-attribute 'default nil
;; 		      :family "Menlo" ;; font
;; 		      :height 150)    ;; font size

;;   ;; ;; 日本語
;;   (set-fontset-font
;;    nil 'japanese-jisx0208
;;    (font-spec :family "Hiragino Mincho Pro")) ;; font
;;   ;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;;   ;; ;; 半角と全角の比を1:2にしたければ
;;   (setq face-font-rescale-alist
;; 	'((".*Hiragino_Mincho_pro.*" . 1.2)))
;;   ;;       '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;;   (set-face-attribute 'default nil :family "Menlo" :height 140)
;;   (set-fontset-font (frame-parameter nil 'font)
;; 		    'japanese-jisx0208
;; 		    (font-spec :family "Hiragino Kaku Gothic ProN"))
;;   (add-to-list 'face-font-rescale-alist
;; 	       '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
;;   )
