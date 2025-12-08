(load "streams.rkt")

(define (square x) (* x x))

(define (sum-odd-squares stream)
  (stream-accumulate + 0
                     (stream-map square (stream-filter odd? stream))))

(sum-odd-squares (stream-values 1 2 3 4 5 6))