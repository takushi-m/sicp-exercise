#!/usr/bin/env gosh
(define (even? n)
  (= (mod n 2) 0))
(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (mul a b)
  (define (iter ans x y)
    (cond ((= y 1) (+ ans x))
          ((even? y) (iter ans (double x) (halve y)))
          (else (iter (+ ans x) x (- y 1)))))
  (iter 0 a b))

(print (mul 1 2)); 2
(print (mul 2 1)); 2
(print (mul 2 3)); 6
(print (mul 2 4)); 8
