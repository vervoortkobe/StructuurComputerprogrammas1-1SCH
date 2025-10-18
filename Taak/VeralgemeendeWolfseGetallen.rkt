(define (wolfse-p n p b)
  (if (< n p)
      b
      (wolfse-helper n p b)
      )
  )

(define (wolfse-helper n p b)
  (define (helper i acc)
    (if (> i p)
        acc
        (helper (+ i 1) (* acc (wolfse-p (- n i) p b)))))
  (helper 1 1))