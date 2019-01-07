
# よく使いたくなるけどよく忘れる Emacs の便利な使い方備忘録

Emacs 

## このメモは
よく使いたくなるけどよく忘れる Emacs の便利な使い方を羅列します。

## フォントサイズを一時的に変える

+ Function : text-scale-adjust
+ Shortcut : C-x C-0

[14.11 Text Scale]
(https://www.gnu.org/software/emacs/manual/html_node/emacs/Text-Scale.html)

## 長い行の折り返し
### 編集なし、折り返して見えるだけ
+ Function : toggle-truncate-lines

[14.21 Line Truncation]
(https://www.gnu.org/software/emacs/manual/html_node/emacs/Line-Truncation.html)

### 編集あり、エンター押す度に編集される
+ Function : auto-fill-mode

[25.6.1 Auto Fill Mode]
(https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Fill.html)

## 矩形選択
+ Function : rectangle-mark-mode
+ Shortcut : C-x SPC

矩形選択モードに切り替える。普通に選択した状態でこれを呼ぶと、選択したエリアが矩形選択に切り替わる。
カット・コピー・ヤンクのショートカットキーは普通のモードと同じ。

[12.5 Rectangles]
(https://www.gnu.org/software/emacs/manual/html_node/emacs/Rectangles.html)

## .emacs.d を大きく改変する場合や org-agenda の大規模な移行のとき

結局 HOME 環境変数を変えてしまうのが一番簡単そう。
こんな感じ。

~~~
HOME=$HOME/NEW_HOME emacs	&
~~~
