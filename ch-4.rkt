#lang racket
(require malt)

(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))
(define theta (list 0.0 0.0))
(define theta-0 (list .0099 0.0))
(define theta-1 (list .6263 0.0))
(define revs 1000)
(define alpha .01)

(gradient-of
 (lambda (theta)
   (sqr theta))
 (tensor 27.0 5.0 2.0))

(define obj
  ((l2-loss line) line-xs line-ys))

(gradient-of obj (list 0.0 0.0))

(define revise
  (lambda (f revs theta)
    (cond
      ((zero? revs) theta)
      (else
       (let ((new-theta (f theta)))
         (revise f (sub1 revs) new-theta))))))

(define f
  (lambda (theta)
    (map (lambda (p)
           (- p 3))
         theta)))

(revise f 5 (list 1 2 3))

(let ((obj ((l2-loss line) line-xs line-ys)))
  (let ((f (lambda (theta)
             (map (lambda (p g)
                    (- p (* alpha g)))
                  theta
                  (gradient-of obj theta)))))
    (revise f revs (list 0.0 0.0))))
