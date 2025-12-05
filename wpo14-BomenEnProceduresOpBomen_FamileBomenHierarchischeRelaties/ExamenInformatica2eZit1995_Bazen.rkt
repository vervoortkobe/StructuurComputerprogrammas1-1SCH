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

(define (bazen-van organigram p)
  (define (bazen-van organigram path)
    (cond ((eq? (baas organigram) p) path)
      (else (bazen-van-in (sub-organigrammen organigram)
                          (cons (baas organigram) path)))))

  (define (bazen-van-in organigrammen path)
    (cond ((null? organigrammen) #f)
          (else (or (bazen-van (car organigrammen) path)
                     (bazen-van-in (cdr organigrammen) path)))))
  (bazen-van organigram '()))

(bazen-van organigram 'bediende2)
