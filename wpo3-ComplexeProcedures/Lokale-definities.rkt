(define (bereken x)
  (define pt1 (/ (- x 1) (+ (* 2 x) 3)))
  (define pt2 (/ (+ (* 2 x) 3) (- x 1)))
  (+ pt1 pt2))