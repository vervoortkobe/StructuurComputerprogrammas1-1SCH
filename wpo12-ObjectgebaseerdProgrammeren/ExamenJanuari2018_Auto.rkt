(define (maak-auto)
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

    (define (vrij? laadstation)
      auto)
             
    (define (dispatch msg)
      (cond ((eq? msg 'withdraw!) withdraw)
            ((eq? msg 'koppel!) koppel)
            ((eq? msg 'ontkoppel!) ontkoppel)
            ((eq? msg 'vrij?) (not auto))
            (else (display "laadstation -- fout bericht"))))
    dispatch))

(define mijn-auto (maak-auto 70))
(mijn-auto 'charge)