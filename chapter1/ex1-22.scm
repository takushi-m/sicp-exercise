#!/usr/bin/env gosh

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (mod b a) 0))
(define (prime? n)
  (define start (runtime))
  (define ret (= (smallest-divisor n) n))
  (if ret (print (list n (- (runtime) start))))
  ret)

(define (search-for-primes start end)
  (cond ((>= start end) (print ""))
        ((= (mod start 2) 0) (search-for-primes (+ start 1) end))
        ((prime? start) (search-for-primes (+ start 2) end))
        (else (search-for-primes (+ start 2) end))))


(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

(print "#(prime microsec)")
(print "around 1000")
(search-for-primes 1000 1020)

(print "around 10000")
(search-for-primes 10000 10040)

(print "around 100000")
(search-for-primes 100000 100050)


;#(prime microsec)
;around 1000
;(1009 12)
;(1013 12)
;(1019 12)
;
;around 10000
;(10007 39)
;(10009 39)
;(10037 38)
;(10039 38)
;
;around 100000
;(100003 122)
;(100019 122)
;(100043 122)
;(100049 122)
