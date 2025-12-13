#lang racket

(define VUBOrganigram
  '(VUB (academisch (rectoraat)
                    (faculteiten
                     (rechten (bachelor (ba-rechten)
                                        (ba-criminologie))
                              (master (ma-rechten)
                                      (ma-criminologie)))
                     (economie)
                     (wetenschappen (bachelor (ba-wiskunde)
                                              (ba-fysica)
                                              (ba-cw))
                                    (master (ma-wiskunde)
                                            (ma-fysica)
                                            (ma-cw)))))
        (administratief (personeel) (financien))))

(define (display-n n d)
  (cond ((> n 0) (display d)
                 (display-n (- n 1) d))))
 
(define (print-lijn aantalblanco tekst)
  (display-n aantalblanco " ")
  (display tekst)
  (newline))

(define (label organigram) (car organigram))
(define (takken organigram) (cdr organigram))

(define (print-vanaf organigram een-label)
  (define (organigram-member een-label organigram)
    (cond ((eq? (label organigram) een-label)
           organigram)
          (else (organigram-member-in een-label (takken organigram)))))
  
  (define (organigram-member-in een-label organigrammen)
    (cond ((null? organigrammen) #f)
          (else (or (organigram-member een-label (car organigrammen))
                    (organigram-member-in een-label (cdr organigrammen))))))
  
  (define (print diepte organigram)
    (print-lijn diepte (label organigram))
    (for-each (lambda (tak)
                (print (+ diepte 1) tak))
              (takken organigram)))
  
  (let ((res (organigram-member een-label organigram)))
    (if res
        (print 0 res)
        #f)))

(print-vanaf VUBOrganigram 'rechten)
