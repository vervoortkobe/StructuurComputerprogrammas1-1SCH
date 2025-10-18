(define (discount prijs korting)
  (exact->inexact (* prijs (/ (- 100 korting) 100))))