;https://soft.vub.ac.be/SCPI/Lijsten_en_symbolische_data.html
;5.14.4.1 Dissectie van een lijst*
(define (rec-dissect-n lst n)
  (define (hulp lst i keep?)
    (cond ((null? lst) '())
          ((= i n) (hulp lst 0 (not keep?)))
          (keep? (cons (car lst) (hulp (cdr lst) (+ i 1) keep?)))
          (else (hulp (cdr lst) (+ i 1) keep?))))
  (hulp lst 0 #t))
(rec-dissect-n '(1 2 3 4 5) 2)
(rec-dissect-n '(1 2 3 4 5 6 7 8) 3)
(rec-dissect-n '(-1 2) 4)

(define (iter-dissect-n lst n)
  (define (hulp lst res i keep?)
    (cond
      ((null? lst) (reverse res))
      ((= i n) (hulp lst res 0 (not keep?)))
      (keep? (hulp (cdr lst) (cons (car lst) res) (+ i 1) keep?))
      (else (hulp (cdr lst) res (+ i 1) keep?))))
  (hulp lst '() 0 #t))
(iter-dissect-n '(1 2 3 4 5) 2)
