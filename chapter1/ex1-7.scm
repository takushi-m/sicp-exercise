#!/usr/bin/env gosh
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2.0))
(define (good-enough? guess x)
  ;(print (- (square guess) x))
  (< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))

(define (sqrt x) (sqrt-iter 1.0 x))

;(print (square (sqrt 0.0001)))
; => 0.0010438358335233748
; 指定した精度は満たしているものの、元の値と10倍以上の開きがあり、平方根を計算しているとは言い難い
; 指定する値が精度より小さいと指定値付近の値との差は精度より小さくなってしまうことが原因である。

;(print (sqrt 1000000000000000.0))
; => 無限ループになる。
; 大きな数字を指定するとimprove関数で情報落ちが発生して
; 値が改善(変化)しなくなる。その時、xとの差が0.001より大きいとループが止まらない。

; 以下のように推定値の差分(改善度合い)を指定する場合には上記の問題は起きない。
(define (sqrt-iter2 guess x)
  (if (good-enough2? (abs (- guess (improve guess x))) guess)
      guess
      (sqrt-iter2 (improve guess x) x)))
(define (good-enough2? diff guess)
  (< (/ diff guess) 0.001))
(define (sqrt2 x) (sqrt-iter2 1.0 x))

(print (square (sqrt2 0.0001)))
; => 1.0001428128408621e-4
(print (square (sqrt2 1000000000000000.0)))
; => 1.0008234823167426e15
