(define (wolfse n)
  (if(< n 2) 4
  (* (wolfse (- n 1)) (wolfse (- n 2))))
  )
(wolfse 5)