#lang racket

(define organigram
  '(directeur
    (hoofd-verkoop (verkoopsleider-vlaanderen)
                   (verkoopsleider-brussel))
    (hoofd-productie (hoofd-inkoop (bediende1)
                                   (bediende2)
                                   (bediende3))
                     (hoofd-fakturen))
    (hoofd-administratie (hoofd-personeel)
                         (hoofd-boekhouding))))

(define (baas organigram) (car organigram))
(define (sub-organigrammen organigram) (cdr organigram))

(define (collegas p organigram)
  (define (werknemers organigram)
    (cons (baas organigram)
          (werknemers-in (sub-organigrammen organigram))))
  
  (define (werknemers-in organigrammen)
    (cond ((null? organigrammen) '())
          (else (append (werknemers (car organigrammen))
                        (werknemers-in (cdr organigrammen))))))
  
  (define (collegas-in oversten organigrammen)
    (cond ((null? organigrammen) #f)
          (else (or (collegas oversten (car organigrammen))
                    (collegas-in oversten (cdr organigrammen))))))
  
  (define (collegas oversten organigram)
    (cond ((eq? p (baas organigram))
           (append oversten
                   (werknemers-in (sub-organigrammen organigram))))
          (else (collegas-in (cons (baas organigram) oversten)
                             (sub-organigrammen organigram)))))
  
  (collegas '() organigram))

(collegas 'hoofd-inkoop organigram)
