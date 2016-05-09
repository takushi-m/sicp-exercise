#!/usr/bin/env gosh
(define (even? n)
  (= (mod n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (+ (* p p) (* q q)); p'
                                 (+ (* q q) (* 2 p q)); q'
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(print (fib 2)); 1
(print (fib 3)); 2
(print (fib 4)); 3
(print (fib 5)); 5
(print (fib 6)); 8
(print (fib 7)); 13
(print (fib 8)); 21

(print (fib 200)); 280571172992510140037611932413038677189525
