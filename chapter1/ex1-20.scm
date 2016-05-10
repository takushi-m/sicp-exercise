#!/usr/bin/env gosh

(define (gcd a b)
  (print (list a b))
  (if (= b 0)
      a
      (gcd b (mod a b))))

(print (gcd 206 40))

- 正規評価順序
(gcd 206 40)
(gcd 40 (mod 206 40))
;(mod 206 40)
(gcd (mod 206 40) (mod 40 (mod 206 40)));(gcd 6 4)
;(mod 40 (mod 206 40))
(gcd (mod 40 (mod 206 40)) (mod (mod 206 40) (mod 40 (mod 206 40))));(gcd 4 2)
;(mod (mod 206 40) (mod 40 (mod 206 40)))
(gcd (mod (mod 206 40) (mod 40 (mod 206 40)))
     (mod (mod 40 (mod 206 40)) (mod (mod 206 40) (mod 40 (mod 206 40)))));(gcd 2 0)
;(mod (mod 40 (mod 206 40)) (mod (mod 206 40) (mod 40 (mod 206 40))))
(mod (mod 206 40) (mod 40 (mod 206 40)))
; 18回

- 適用評価順序
(gcd 206 40)
(gcd 40 (mod 206 40))
(gcd 40 6)
(gcd 6 (mod 40 6))
(gcd 6 4)
(gcd 4 (mod 6 4))
(gcd 4 2)
(gcd 2 (mod 4 2))
(gcd 2 0)
; 4回
正規評価順序ではif分の部分でもmodを計算する必要があるので回数が増える
