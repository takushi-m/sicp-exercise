#!/usr/bin/env gosh

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (mod b a) 0))

(print (smallest-divisor 199)); 199
(print (smallest-divisor 1999)); 1999
(print (smallest-divisor 19999)); 7
