#lang racket
(require malt)

(define line
  (lambda (x)
    (lambda (theta)
      (+
       (* (list-ref theta 0) x)
       (list-ref theta 1)))))

(define line-xs
  (tensor 2.0 1.0 4.0 3.0))

(define line-ys
  (tensor 1.8 1.2 4.2 3.3))
