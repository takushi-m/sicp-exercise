#!/usr/bin/env gosh

(define (cube x) (* x x x))
(define (p x)
  ;(print "p")
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(print (sine 12.15)); (a)pが呼ばれる回数は5回
