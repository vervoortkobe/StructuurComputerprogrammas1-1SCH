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

(define (hierarchisch? p1 p2 organigram)
  (define (hierarchisch?-helper organigram path)
    (cond ((and (eq? (baas organigram) p1) (member p2 path)) #t)
          ((and (eq? (baas organigram) p2) (member p1 path)) #t)
          (else (hierarchisch?-in (sub-organigrammen organigram)
                                  (cons (baas organigram) path)))))
  
  (define (hierarchisch?-in organigrammen path)
    (cond ((null? organigrammen) #f)
          (else (or (hierarchisch?-helper (car organigrammen) path)
                    (hierarchisch?-in (cdr organigrammen) path)))))
  
  (hierarchisch?-helper organigram '()))

(hierarchisch? 'directeur 'verkoopsleider-brussel organigram)
(hierarchisch? 'bediende1 'hoofd-productie organigram)
(hierarchisch? 'hoofd-personeel 'bediende3 organigram)
