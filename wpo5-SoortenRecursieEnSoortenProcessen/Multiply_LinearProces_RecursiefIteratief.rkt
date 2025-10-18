(define (rec-multiply a b)
  (if (= b 0)
      0
      (+ a (rec-multiply a (- b 1))))
  )

(define (iter-multiply a b)
  (define (iter result counter)
    (if (= counter 0)
        result
        (iter (+ result a) (- counter 1))))
  (iter 0 b))