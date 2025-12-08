; Implementatie van het Stream-ADT, dit keer gebaseerd op uitgestelde lijsten
;
; Het enige wat je moet weten is de volgende equivalentie:
;
;           (cons-stream x y) <=> (cons x (delay y))
;
; Hoe dat exact gebeurt (met de zelfgemaakte special form 'cons-stream')
; is niet belangrijk (abstractie!).

(define the-empty-stream '())

(define (empty-stream? stream)
  (null? stream))

(define-syntax cons-stream     ; DETAILS NIET BELANGRIJK VOOR 1BA
  (syntax-rules ()             ; DETAILS NIET BELANGRIJK VOOR 1BA
    ((cons-stream el str)      ; DETAILS NIET BELANGRIJK VOOR 1BA
     (cons el (delay str)))))  ; DETAILS NIET BELANGRIJK VOOR 1BA

(define (head stream)
  (car stream))

(define (tail stream)
  (force (cdr stream)))

;; herbruikbare operators
(define (take str n)
  (cond ((= n 0)
         '())
        ((empty-stream? str)
         '())
        (else
         (cons (head str) (take (tail str) (- n 1))))))

(define (stream-filter pred str)
  (cond ((empty-stream? str)
         the-empty-stream)
        ((pred (head str))
         (cons-stream (head str) (stream-filter pred (tail str))))
        (else
         (stream-filter pred (tail str)))))

(define (stream-map proc str)
  (if (empty-stream? str)
      the-empty-stream
      (cons-stream (proc (head str)) (stream-map proc (tail str)))))

(define (stream-accumulate op init str)
  (if (empty-stream? str)
      init
      (op (head str) (stream-accumulate op init (tail str)))))

(define (stream-accumulate-n op init strs)
  (if (empty-stream? (head strs))
      the-empty-stream
      (cons-stream
       (stream-accumulate op init (stream-map head strs))
       (stream-accumulate-n op init (stream-map tail strs)))))

;; eindige operators
(define (stream-for-each proc str)
  (if (empty-stream? str)
      'done
      (begin (proc (head str))
             (stream-for-each proc (tail str)))))

(define (stream-append str1 str2)
  (if (empty-stream? str1)
      str2
      (cons-stream (head str1) (stream-append (tail str1) str2))))

(define (stream-flatten strs)
  (stream-accumulate stream-append the-empty-stream strs))
     
(define (stream-interleave str1 str2)
  (if (empty-stream? str1)
      str2
      (cons-stream 
       (head str1)
       (stream-interleave str2 (tail str1)))))

(define (stream-print s)
  (display "[ ")
  (stream-for-each (lambda (x) (display x) (display " ")) s)
  (display "]")
  (newline)
  'ok)

;; oneindige operators
(define (stream-accumulate-delayed com init stream)
  (if (empty-stream? stream)
      init
      (com (head stream)
           (delay
             (stream-accumulate-delayed com init (tail stream))))))

(define (stream-interleave-delayed s1 s2)
  (if (empty-stream? s1)
      (force s2)
      (cons-stream 
       (head s1)
       (stream-interleave-delayed (force s2) (delay (tail s1))))))

(define (stream-flatten/interleaved stream)
  (stream-accumulate-delayed stream-interleave-delayed the-empty-stream stream))

;; adhoc operators
(define (stream-values . vals)
  (define (rec lst)
    (if (null? lst)
        the-empty-stream
        (cons-stream (car lst) (rec (cdr lst)))))
  (rec vals))

(define (enumerate-tree tree)
  (if (leaf? tree)
      (cons-stream tree the-empty-stream)
      (stream-append (enumerate-tree (left tree))
                     (enumerate-tree (right tree)))))

(define (stream-append str1 str2)
  (if (empty-stream? str1)
      str2
      (cons-stream (head str1) (stream-append (tail str1) str2))))

(define (enumerate-int low high)
  (if (> low high)
      the-empty-stream
      (cons-stream low (enumerate-int (+ 1 low) high))))

(define (pairs s1 s2)
  (stream-flatten/interleaved
   (stream-map (lambda (i)
                 (stream-map (lambda (j)
                               (list i j))
                             s2))
               s1)))
