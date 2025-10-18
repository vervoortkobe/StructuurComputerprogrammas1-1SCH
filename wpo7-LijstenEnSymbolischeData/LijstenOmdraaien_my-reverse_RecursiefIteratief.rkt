(define (rec-reverse l)
  (if (null? l)
      '()
      (append (rec-reverse (cdr l)) (list (car l)))
      )
  )

(define (iter-reverse l)
  (define (iter lst acc)
    (if (null? lst)
        acc
        (iter (cdr lst) (cons (car lst) acc))
        )
    )
  (iter l '())

  )