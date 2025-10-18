(define (hofstadter-V n)
  (if (= n 0) 1
  (- n (hofstadter-M (hofstadter-V (- n 1)))))
  )

(define (hofstadter-M n)
  (if (= n 0) 0
  (- n (hofstadter-V (hofstadter-M (- n 1)))))
  )