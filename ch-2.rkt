#lang racket
(require malt)

;(define rank
;  (lambda (t)
;    (cond
;      ((scalar? t) 0)
;      (else
;       (add1
;        (rank (tref t 0)))))))

(define rank
  (lambda (t)
    (ranked t 0)))

(define ranked
  (lambda (t a)
    (cond
      ((scalar? t) a)
      (else
       (ranked (tref t 0) (add1 a))))))

(define shape
  (lambda (t)
    (cond
      ((scalar? t) (list))
      (else
       (cons
        (tlen t)
        (shape (tref t 0)))))))

(define sum
  (lambda (t)
    (summed t
            (sub1 (tlen t))
            0.0)))

(define summed
  (lambda (t i a)
    (cond
      ((zero? i) (+ (tref t 0) a))
      (else
       (summed
        t
        (sub1 i)
        (+ (tref t i) a))))))

(rank
 (tensor
  (tensor
   (tensor 8) (tensor 9) (tensor 4) (tensor 7))))
(shape
 (tensor
  (tensor
   (tensor 8) (tensor 9) (tensor 4) (tensor 7))))
(sum (tensor 8 9 4 7))
