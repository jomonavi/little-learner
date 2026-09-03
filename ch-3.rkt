#lang racket
(require malt)

(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))
(define theta (list 0.0 0.0))
(define theta-0 (list .0099 0.0))
(define theta-1 (list .6263 0.0))

(define predicted-ys
  ((line
    line-xs)
   theta))

(sum
 (sqr
  (- line-ys predicted-ys)))

(define l2-loss
  (lambda (target)
    (lambda (xs ys)
      (lambda (theta)
        (let((pred-ys ((target xs) theta)))
          (sum
           (sqr
            (- ys pred-ys))))))))

(((l2-loss line) line-xs line-ys) theta)
(((l2-loss line) line-xs line-ys) theta-0)
(((l2-loss line) line-xs line-ys) theta-1)
(/
 (-
  (((l2-loss line) line-xs line-ys) theta-1)
  (((l2-loss line) line-xs line-ys) theta-0))
 .6263)