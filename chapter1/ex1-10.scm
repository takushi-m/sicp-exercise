#!/usr/bin/env gosh
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(print (A 1 10)) ; 1024
(print (A 2 4)) ; 65536
(print (A 3 3)) ; 65536

(define (f n) (A 0 n)); => 2n
(print (f 1)); 2
(print (f 10)); 20

(define (g n) (A 1 n))
;(A 1 n)
;=> (A 0 (A 1 (- n 1)))
;=> (* 2 (A 1 (- n 1)))
;(A 1 1)は2であり、(A 1 n)=(* 2 (A 1 (- n 1)))から
;(A 1 n)= 2^n
(print (g 2));4
(print (g 6));64

(define (h n) (A 2 n))
;(A 2 n)
;=> (A 1 (A 2 (- n 1)))
;=> (exp 2 (A 2 (- n 1)))
;n回(exp 2 ...)がネストされた関数
(print (h 3)); => (exp 2 (exp 2 2)) => 16
