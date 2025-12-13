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

(define (budget boom budget-list)
  (define (budget-hulp boom budget-list)
    (if (null? budget-list)
        0
        (+ (car budget-list)
         (budget-hulp-in (kinderen boom) (cdr budget-list)))))

  (define (budget-hulp-in bomen budget-list)
    (if (null? bomen)
        0
        (+ (budget-hulp (car bomen) budget-list)
           (budget-hulp-in (cdr bomen) budget-list))))

  (budget-hulp-in (kinderen boom) budget-list))

(budget familieboom '(100 50 20))
