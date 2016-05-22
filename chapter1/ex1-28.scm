#!/usr/bin/env gosh
(use srfi-27)

(define (square x) (* x x))

(define (check t n)
  (cond ((= t 1) t)
        ((= t (- n 1)) t)
        ((= (mod (square t) n) 1) 0)
        (else t)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (mod (square (check (expmod base (/ exp 2) m) m)) m))
        (else (mod (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random-integer (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))


(print (fast-prime? 1000 100))

(print (fast-prime? 1009 100))
(print (fast-prime? 1000003 100))

(print (fast-prime? 1105 10))
(print (fast-prime? 6601 10))
