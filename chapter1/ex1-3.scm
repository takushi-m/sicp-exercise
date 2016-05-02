#!/usr/bin/env gosh
(use gauche.test)

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (f x y z)
  (cond
    ((and (> x z) (> y z)) (sum-of-squares x y))
    ((and (> x y) (> z y)) (sum-of-squares x z))
    (else (sum-of-squares y z))))

(test-start "test")

(test* "test1" 13 (f 1 2 3))
(test* "test2" 13 (f 3 1 2))
(test* "test3" 13 (f 2 3 1))
(test* "test4" 8 (f 1 2 2))
(test* "test5" 5 (f 1 1 2))
(test* "test6" 2 (f 1 1 1))

(test-end :exit-on-failure #t)
