(define (schuif-in! lst1 lst2)
    (cond ((null? (cdr lst1)) (set-cdr! lst1 lst2) 'ok)
          ((null? lst2) 'ok)
           (else
            (let ((rest1 (cdr lst1))
                  (rest2 (cdr lst2)))
              (set-cdr! lst1 lst2)
              (set-cdr! lst2 rest1)
              (schuif-in! rest1 rest2)))))

(define lijst1 '(1 3 5))
(define lijst2 '(2 4 6 8))
(schuif-in! lijst1 lijst2)

lijst1