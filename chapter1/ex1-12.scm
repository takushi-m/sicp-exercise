#!/usr/bin/env gosh
(define (pascal n m)
  (cond ((= n 1) 1)
        ((= m 1) 1)
        ((= n m) 1)
        (else (+ (pascal (- n 1) (- m 1))
                 (pascal (- n 1) m)))))

(print (pascal 4 1)); 1
(print (pascal 4 2)); 3
(print (pascal 4 3)); 3
(print (pascal 4 4)); 1
