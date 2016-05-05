#!/usr/bin/env gosh

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(print (f-rec 2)); 2
(print (f-rec 3)); 4
(print (f-rec 4)); 11

(define (f-iter n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
  (iter 2 1 0 n))

(print (f-iter 2)); 2
(print (f-iter 3)); 4
(print (f-iter 4)); 11
