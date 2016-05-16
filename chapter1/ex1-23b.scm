#!/usr/bin/env gosh

(define (smallest-divisor n)
  (if (divides? 2 n)
      2
      (find-divisor n 3)))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 2)))))
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
;(1013 8)
;(1019 7)
;
;around 10000
;(10007 20)
;(10009 20)
;(10037 20)
;(10039 20)
;
;around 100000
;(100003 63)
;(100019 62)
;(100043 63)
;(100049 62)
;
;around 1000000
;(1000003 196)
;(1000033 196)
;(1000037 196)
;(1000039 196)

;1-23.scmの結果では1.7-8倍程度だが、こちらの結果ではほぼ2倍になっている。
;こちらのコードでは`next`関数を省いている。このことから、奇数だけを判定することで
;確かに二倍速にはなるが、`next`関数を導入したコストにより2倍速にはならず
;多少遅くなってしまっていることがわかる。
