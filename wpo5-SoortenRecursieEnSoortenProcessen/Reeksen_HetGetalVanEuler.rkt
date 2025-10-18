(define (calc-e n)
  (define (iter i res fac-prev)
    (define new-fac (* fac-prev i))
    (if (> i n)
        res
        (iter (+ 1 i) (+ res (/ 1 new-fac)) new-fac)))
  (iter 1 1 1))