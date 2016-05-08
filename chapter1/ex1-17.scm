#!/usr/bin/env gosh
(define (even? n)
  (= (mod n 2) 0))
(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (mul a b)
  (cond ((= a 1) b)
        ((= b 1) a)
        ((even? b) (mul (double a) (halve b)))
        (else (+ a (mul a (- b 1))))))

(print (mul 1 2)); 2
(print (mul 2 1)); 2
(print (mul 2 3)); 6
(print (mul 2 4)); 8
