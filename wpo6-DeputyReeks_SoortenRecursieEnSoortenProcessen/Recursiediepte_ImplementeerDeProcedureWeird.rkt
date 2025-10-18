(define (weird x)
  (cond ((= x 1) 1)
        ((even? x) (weird (/ x 2)))
        (else (weird (+ (* 3 x) 1)))
        )
  )
;iteratief proces, want (tijdelijk) resultaat wordt doorgegeven in staartpositie