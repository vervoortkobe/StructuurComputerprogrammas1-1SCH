(define (accumulate combiner null-value term a next b)
  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (combiner (term a) res))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product factor a next b)
  (accumulate * 1 factor a next b))