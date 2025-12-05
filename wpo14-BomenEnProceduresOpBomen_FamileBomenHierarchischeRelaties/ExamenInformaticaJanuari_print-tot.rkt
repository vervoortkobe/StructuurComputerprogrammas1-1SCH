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

(define (print-tot organigram niveau)
  (define (print diepte organigram)
    (cond ((<= diepte niveau)
           (print-lijn diepte (label organigram))
           (for-each (lambda (organigram)
                       (print (+ diepte 1) organigram))
                     (takken organigram)))))
  (print 0 organigram))

(print-tot VUBOrganigram 2)
