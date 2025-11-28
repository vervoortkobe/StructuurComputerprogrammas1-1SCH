(define (maak-auto capaciteit)
  (let ((opgeladen 100)
        (laadstation #f))

    (define (charge!)
      (if laadstation
          (let ((lading-nodig (* (/ (- 100 opgeladen) 100)
                                 capaciteit)))
            ((laadstation 'withdraw!) lading-nodig)
            (set! opgeladen 100))))

    (define (koppel! station)
      (cond ((not laadstation)
             (set! laadstation station)
             ((station 'koppel!) dispatch))))
    
    (define (ontkoppel!)
      (cond (laadstation
              ((laadstation 'ontkoppel!))
              (set! laadstation #f))))

    (define (dispatch msg)
      (cond ((eq? msg 'charge) opgeladen)
            ((eq? msg 'charge!) charge!)
            ((eq? msg 'koppel!) koppel!)
            ((eq? msg 'ontkoppel!) ontkoppel!)
            (else (display "Auto -- fout bericht"))))
    dispatch))

(define mijn-auto (maak-auto 70))
(mijn-auto 'charge)
