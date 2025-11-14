(define (merge! best1 best2)
  (define (merge-in current rest1 rest2)
    (cond ((null? rest1) (set-cdr! current rest2))
          ((null? rest2) (set-cdr! current rest1))
          ((element=? (car rest1) (car rest2))
           (set-cdr! current rest1)
           (merge-in rest1 (cdr rest1) (cdr rest2)))
          ((symbol<? (caar rest1) (caar rest2))
           (set-cdr! current rest1)
           (merge-in rest1 (cdr rest1) rest2))
          (else
            (set-cdr! current rest2)
           (merge-in rest2 rest1 (cdr rest2)))))
  (let* ((current (if (symbol<? (caar best1)
                                (caar best2))
                      best1
                      best2))
         (rest1 (cdr current))
         (rest2 (if (eq? current best1)
                    best2
                    best1)))
    (merge-in current rest1 rest2) current))

(define (symbol<? s1 s2)
  (string<? (symbol->string s1) (symbol->string s2)))
 
(define (element=? el1 el2)
  (equal? el1 el2))

(define best1 '((ann (meiboomstraat 12 1820 Eppegem))
                (bert (populierendreef 7 1050 Brussel))
                (kurt (Mechelsesteenweg 50 1800 Vilvoorde))))
 
(define best2 '((bert (populierendreef 7 1050 Brussel))
                (jan (eikestraat 1 9000 Gent))
                (sofie (boerendreef 5  2800 Mechelen))))

(merge! best1 best2)