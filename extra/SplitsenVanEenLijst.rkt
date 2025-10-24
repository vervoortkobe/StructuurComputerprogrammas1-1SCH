;https://soft.vub.ac.be/SCPI/Lijsten_en_symbolische_data.html
;5.14.4.2 Splitsen van een lijst
(define (split lst n)
  (define (hulp lst wel niet i keep?)
    (cond
      ((null? lst) (list (reverse wel) niet))
      ((= i n) (hulp lst wel niet 0 (not keep?)))
      (keep? (hulp (cdr lst) (cons (car lst) wel) niet (+ i 1) keep?))
      (else (hulp (cdr lst) wel (cons (car lst) niet) (+ i 1) keep?))))
  (hulp lst '() '() 0 #t)
  )
(split '(1 2 3 4 5) 2)
