(define (accumulate combiner null-value term a next b)
  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (combiner (term a) res))))
  (iter a null-value))