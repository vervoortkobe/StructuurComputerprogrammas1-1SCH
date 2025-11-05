(define (iter-product factor a next b)
  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (* (factor a) res))))
  (iter a 1))

(iter-product
 (lambda (a) a)
 2
 (lambda (a) (+ a 2))
 6)