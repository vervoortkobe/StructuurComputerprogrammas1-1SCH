(define (maak-laadstation)
  (let ((afgenomen 0)
        (auto #f))

    (define (withdraw! laatstation lading)
      (if auto
          (set! afgenomen (+ afgenomen lading))))

    (define (koppel! obj)
      (if (not auto)(set! auto obj)))

    (define (ontkoppel! obj)
      (if auto
          (set! auto #f)))
             
    (define (dispatch msg)
      (cond ((eq? msg 'withdraw!) withdraw)
            ((eq? msg 'koppel!) koppel)
            ((eq? msg 'ontkoppel!) ontkoppel)
            ((eq? msg 'vrij?) (not auto))
            (else (display "laadstation -- fout bericht"))))
    dispatch))

(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

(define (maak-stations n)
  (if (<= n 0)
      '()
      (cons (maak-laadstation) (maak-stations (- n 1)))))

(define (maak-laadpark n)
  (let ((stations (maak-stations n)))

    (define (enter! auto)
      (let ((vrije-stations (filter (lambda (s) (s 'vrij?)) stations)))
        (if (null? vrije-stations)
            #f
            ((auto 'koppel!) (car vrije-stations)))))

    (define (full? stations)
      (if (null? stations)
          #t
          (and (not ((car stations) 'vrij?))
               (full? (cdr stations)))))

    (define (dispatch msg)
      (cond ((eq? msg 'full?) (full? stations))
        ((eq? msg 'enter!) enter!)
        (else (display "Laadpark -- fout bericht"))))
    dispatch))
