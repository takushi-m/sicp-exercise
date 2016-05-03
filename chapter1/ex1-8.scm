#!/usr/bin/env gosh
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2.0 guess)) 3.0))
(define (good-enough? diff guess)
  (< (/ diff guess) 0.001))
(define (iter guess x)
  (if (good-enough? (abs (- guess (improve guess x))) guess)
      guess
      (iter (improve guess x) x)))
(define (third-root x) (iter 1.0 x))


(print (third-root 27.0))
; => 3.001274406506175
