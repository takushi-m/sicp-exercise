#!/usr/bin/env gosh

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
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

(print "around 1000000")
(search-for-primes 1000000 1000050)

;#(prime microsec)
;around 1000
;(1009 8)
;(1013 7)
;(1019 8)
;
;around 10000
;(10007 22)
;(10009 23)
;(10037 22)
;(10039 22)
;
;around 100000
;(100003 69)
;(100019 69)
;(100043 70)
;(100049 69)
;
;around 1000000
;(1000003 218)
;(1000033 218)
;(1000037 218)
;(1000039 219)
