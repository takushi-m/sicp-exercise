#!/usr/bin/env gosh
(define (even? n)
  (= (mod n 2) 0))

(define (fast-expt b n)
  (define (iter a n)
    (cond ((<= n 1) a)
          ((even? n) (iter (* a b b) (/ n 2)))
          (else (iter (* a b) (- n 1)))))
  (iter 1 n))

(print (fast-expt 2 3)); 8
(print (fast-expt 2 0)); 1
(print (fast-expt 2 4)); 16
