(define (wolfse-3 n b)
  (if (< n 3)
      b
      (* (wolfse-3 (- n 1) b) (* (wolfse-3 (- n 2) b) (wolfse-3 (- n 3) b))))
  )