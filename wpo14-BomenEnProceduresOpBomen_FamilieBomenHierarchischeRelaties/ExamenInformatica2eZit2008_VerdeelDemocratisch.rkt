#lang racket

(define familieboom '(jan (piet (frans (tom)
                                       (roel))
                                (mie))
                          (bram (inge (bert (ina)
                                            (ilse))
                                      (bart))
                                (iris))
                          (joost (els (ilse)))))

(define (familiehoofd fam) (car fam))
(define (kinderen fam) (cdr fam))
(define (laatste-nakomeling? fam)
  (null? (kinderen fam)))

(define (verdeel-democratisch boom budget)
  (define (verdeel boom)
    (cond ((laatste-nakomeling? boom) 1)
      (else (+ 1 (verdeel-in (kinderen boom))))))

  (define (verdeel-in bomen)
    (cond ((null? bomen) 0)
          (else (+ (verdeel (car bomen))
               (verdeel-in (cdr bomen))))))
  (/ budget (verdeel-in (kinderen boom))))

(verdeel-democratisch familieboom 1500)
