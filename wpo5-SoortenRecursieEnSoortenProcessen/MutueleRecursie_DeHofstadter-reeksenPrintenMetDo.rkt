(define (hofstadter-V n)
  (if (= n 0) 1
  (- n (hofstadter-M (hofstadter-V (- n 1)))))
  )

(define (hofstadter-M n)
  (if (= n 0) 0
  (- n (hofstadter-V (hofstadter-M (- n 1)))))
  )

(define (hofstadter-reeksen x) 
  (define count x)
  (do ((i 0 (+ i 1)))
      ((= i x))
      (display (hofstadter-V i))
      (display " ")
      (display (hofstadter-M i))
      (newline)
      )
  )